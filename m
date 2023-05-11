Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFF920683
	for <linux-coco@lists.linux.dev>; Thu, 11 May 2023 19:26:36 +0000 (UTC)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34BJCE78025370;
	Thu, 11 May 2023 19:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=RMhfFFn+sFC71jiUVq1M5w5Fk5bREHjbd6hpNyxc14Q=;
 b=PkTTFHbqWaDdvbKk50amq4TVrG9NJt2b0tEBbQAEKpuyZMst/mUExc+/Fad25RQrS0t9
 sP5LNGXw+QLe2b+IOFrLl1URzigEeynWTrgEV3QOb3r8ZRW3seQPg0+LXP6gw1Ov0kH6
 JeNz1TqVZECPX9slgBPIK1KAJ1qW6j4kE+Ya8HCEU2HWIA+hfzYjy+TGN/yqW6QzRaxf
 3IO5i6vVpMWbh1eYWG2sciQTw1QJqbVHc6SnG2D1ynDqJbxpQnwAlxF7LjDBjJ7oRd0U
 LzTBtURPJms7d54X4Q/2aR6pFkx8IH9F+FbdBHvgiQZyyXFJLUvKYBOsYOFqVrdH6tNQ jg== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qh6acrgqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 May 2023 19:26:34 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34BHfT9s019504;
	Thu, 11 May 2023 19:26:32 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3qf7nk5m92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 May 2023 19:26:32 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34BJQVWM64094678
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 May 2023 19:26:31 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5CA5B5803F;
	Thu, 11 May 2023 19:26:31 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E25585804E;
	Thu, 11 May 2023 19:26:30 +0000 (GMT)
Received: from li-a300cfcc-3261-11b2-a85c-fa2d52d0d140.ibm.com (unknown [9.65.228.23])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 11 May 2023 19:26:30 +0000 (GMT)
Message-ID: <53adca2d4e8287f2189c631be611c9c76ee1b708.camel@linux.ibm.com>
Subject: Re: [RFD] COCONUT-SVSM project governance
From: Claudio Carvalho <cclaudio@linux.ibm.com>
To: =?ISO-8859-1?Q?J=F6rg_R=F6del?= <jroedel@suse.de>,
        amd-sev-snp@lists.suse.com
Cc: linux-coco@lists.linux.dev
Date: Thu, 11 May 2023 15:26:30 -0400
In-Reply-To: <ZFjL0oXu6NjYKCXl@suse.de>
References: <ZFjL0oXu6NjYKCXl@suse.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1wvO4ZgAkRJumSFfmjGILuKEG1-XiGeN
X-Proofpoint-ORIG-GUID: 1wvO4ZgAkRJumSFfmjGILuKEG1-XiGeN
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-11_15,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 mlxscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305110164

On Mon, 2023-05-08 at 12:15 +0200, J=C3=B6rg R=C3=B6del wrote:
> Hi,
>=20

Hi Everybody,

> As discussed before[1] I'd like to start a discussion about the future
> governance of COCONUT-SVSM. Bottom line is that the project should move
> from a single-maintainer, SUSE-driven project to a multi-maintainer
> model driven by the community.
>=20
> [1] https://lore.kernel.org/linux-coco/ZFJTDtMK0QqXK5+E@suse.de/
>=20
> Some of the things to discuss:


>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* How many maintainers? (=
3 or more?)
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* How to select them (by =
contributions and trust in the
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 community? electio=
ns? If elections, who can vote?)
>=20

At least 3 maintainers looks good, but I think we will have a better answer=
 once
we know the number of maintainer candidates and their experience/interest.

An option could be to have maintainer(s) per area. I have worked on the
vtpm/attestation for the AMDESE/linux-svsm and I could help to maintain it =
(and
other parts) in the coconut-svsm.

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Regular changes to the =
maintainer group?
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* How the group makes dec=
isions on merging contributions and
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the general direct=
ion of the project.
>=20
> And certainly more questions which I have not yet thought of.

We may also want to discuss about release plan/model; e.g. the dynamics of =
new
releases, how often they will happen and if there is any priority that we n=
eed
to consider in the short term.

Thanks,

Claudio

>  So I'd
> like to invite everyone to share their thoughts and opinions in this
> thread so that we can develop a way to an open project governance :)
>=20
> Regards,
>=20

