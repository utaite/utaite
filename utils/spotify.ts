import fetch from "isomorphic-unfetch";
import { stringify } from "querystring";

const {
  SPOTIFY_CLIENT_ID: client_id,
  SPOTIFY_CLIENT_SECRET: client_secret,
  SPOTIFY_REFRESH_TOKEN: refresh_token,
} = process.env;

const basic = Buffer.from(`${client_id}:${client_secret}`).toString("base64");
const Authorization = `Basic ${basic}`;

export async function getAuthorizationToken() {
  const url = new URL("https://accounts.spotify.com/api/token");
  const body = stringify({
    grant_type: "refresh_token",
    refresh_token,
  });
  const response = await fetch(`${url}`, {
    method: "POST",
    headers: {
      Authorization,
      "Content-Type": "application/x-www-form-urlencoded",
    },
    body,
  }).then((r) => r.json());

  return `Bearer ${response.access_token}`;
}

const NOW_PLAYING_ENDPOINT = `https://api.spotify.com/v1/me/player/currently-playing`;
export async function nowPlaying() {
    const Authorization = await getAuthorizationToken();
    const response = await fetch(NOW_PLAYING_ENDPOINT, {
        headers: {
            Authorization,
        },
    });
    const { status } = response;
    if (status === 204) {
        return {};
    } else if (status === 200) {
        const data = await response.json();
        return data;
    }
}

const RECENTLY_PLAYED_ENDPOINT = `https://api.spotify.com/v1/me/player/recently-played`;
export async function recentlyPlayed() {
    const Authorization = await getAuthorizationToken();
    const response = await fetch(RECENTLY_PLAYED_ENDPOINT, {
        headers: {
            Authorization,
        },
    });
    const { status } = response;
    if (status === 204) {
        return {};
    } else if (status === 200) {
        const data = await response.json();
        return data;
    }
}

const TOP_TRACKS_ENDPOINT = `https://api.spotify.com/v1/me/top/tracks`;
export async function topTracks(time_range) {
    const Authorization = await getAuthorizationToken();
    const response = await fetch(`${TOP_TRACKS_ENDPOINT}?time_range=${time_range}`, {
        headers: {
            Authorization,
        },
    });
    const { status } = response;
    if (status === 204) {
        return {};
    } else if (status === 200) {
        const data = await response.json();
        return data;
    }
}
