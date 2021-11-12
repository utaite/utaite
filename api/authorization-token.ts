import { NowRequest, NowResponse } from "@vercel/node";
import { getAuthorizationToken } from "../utils/spotify";

export default async function (req: NowRequest, res: NowResponse) {
  const authorizationToken = await getAuthorizationToken();
  return res.status(200).send(authorizationToken);
}
