Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BF42C688
	for <linux-coco@lists.linux.dev>; Sat, 27 Jan 2024 16:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706372995; cv=none; b=QZ/q86P7b1HrMK0JrQ2cPVXCigXOEnex8ZtK4vppwBIXHBIqCLy8uJ2uMjGH1YYdAw1DVfbHz+LRkux/vasvjREXP2veFvu1yY4aPH5zG35Unclm7wmMjn7RRceCjKRSw/vPZ8l4xk2gz/l2paFvRHFuaSIMuev0o01cYf6v0yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706372995; c=relaxed/simple;
	bh=dzxpp5d3Mn6cnJiaIafkzAQMeVzbQKA1PF9boiAtJZw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sdDixmG5y2eP/t/eLzeWQlQWX6LXuyQLxYYiDrPqtHK3LnN0zgL6USFfEN7m0CaM9bqjAPZMxkhmC4LjznaVb8xaZEKJUbzDL+TAcfNxEQhpK5jBHoY0Hdt7V9Mxv6jYpKhvc7BN/cwPZvrEsxWh4THG5RMzRfP97LLDF5+N/Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=aSlfbC2q; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="aSlfbC2q"
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40RCfC9Y026702;
	Sat, 27 Jan 2024 16:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=lwt2yCIriYVDVFm69RSoLEU/GPW/jcYtp1SLx39wluo=;
 b=aSlfbC2qtg0r1nX7dBZJDpSwjxaG8mc76yKa0fuynLQonGZCirEufOrtQDAbLmF5rDjF
 VWhcr2Ugds4w1tlZtY2ArADfss8j/vvSRWM7L2CNAVJwmqhNh3p2IS3v6225immYq0ZX
 TaUUuLdX1cSGl4zbGnSTKDRMzcNQonmgbIKbyNvT/3du8wZvRhHMQQ9O/a7KMnYCbgn4
 PeW2wuKqtRBwkIWhxkOSgPUpjhs4xkqlXwBndtzvONydTxfT92HwGghcJ/oFKvFptn/H
 BRMNDzX+PW+VXHyJCVX6/JQElvpOyNnzUDMGLqWYtgPArQ4DR+WjPTyCMZ886+brCrRg hg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vvx1rp7e3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Jan 2024 16:29:47 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40RGTk7M003446;
	Sat, 27 Jan 2024 16:29:46 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vvx1rp7du-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Jan 2024 16:29:46 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40REcuV5022426;
	Sat, 27 Jan 2024 16:29:45 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vrt0msugg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Jan 2024 16:29:45 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40RGTjYH41615814
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 27 Jan 2024 16:29:45 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2FDE858058;
	Sat, 27 Jan 2024 16:29:45 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 99A4A58057;
	Sat, 27 Jan 2024 16:29:42 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.67.185.238])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 27 Jan 2024 16:29:42 +0000 (GMT)
Message-ID: <9d601eaa42c3ecf659a5af74ab24a9bafc3c60ce.camel@linux.ibm.com>
Subject: Re: Attestation evidence collection "standard package(s)" effort
From: James Bottomley <jejb@linux.ibm.com>
Reply-To: jejb@linux.ibm.com
To: Dionna Amalie Glaze <dionnaglaze@google.com>, linux-coco@lists.linux.dev,
        hannes.tschofenig@gmail.com,
        Yogesh Deshpande
 <Yogesh.Deshpande@arm.com>,
        Thomas Fossati <thomas.fossati@linaro.org>,
        Thomas Fossati <Thomas.Fossati@arm.com>, public@thson.de,
        Jeff Andersen
 <jeffandersen@google.com>,
        Chong Cai <chongc@google.com>, roksana.golizadeh.mojarad@intel.com,
        Dan Williams <dan.j.williams@intel.com>
Date: Sat, 27 Jan 2024 11:29:41 -0500
In-Reply-To: <CAAH4kHarATWGg6S9DGA9a+yvSgLGY417xf2AZGO0ae=f2Z2aKQ@mail.gmail.com>
References: 
	<CAAH4kHarATWGg6S9DGA9a+yvSgLGY417xf2AZGO0ae=f2Z2aKQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: P3d-k1NH3CzCz97x_c-bFIJBFJN7eHRo
X-Proofpoint-ORIG-GUID: kMPVtztT3hXgMnFaUjyNB6hu_OXJrQrx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1011
 phishscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401270124

On Tue, 2024-01-23 at 10:44 -0800, Dionna Amalie Glaze wrote:
> Hi all, I thought I'd start the conversation here about a concern I'm
> hearing in various working groups. There are many software packages
> folks are writing to provide in their VM guest images to gather
> attestation reports and quotes, and no one feels they have a good
> mandate to say "X package is what everyone ought to use" and that it
> should be in most distributions' software repositories.
> 
> I'm not coming here with a suggested 15th tool that standardizes all
> the other 14 standards, but to see what folks' requirements are such
> that we can establish a concerted effort to solve them as a
> collective. I still will suggest a concrete starting point to focus
> the conversation.
> 
> The problem I think a large majority of us want to solve is how to
> provide evidence to (possibly remote) requesters in a standard
> format.
> 
> Challenges:
> 
> 1. authZN: who is allowed to gather evidence? To make attestation
> work with a background check model (RFC9334) and seamlessly for users
> who want "security sprinkles", the standard tool should be a daemon
> that provides an evidence collection service for a standard protocol.
> I'd recommend getting a tcp port assigned from the IANA and combining
> TLS with OAuth 20 to pass "evidence challenge requests" to the server
> and get evidence out. This is just a concrete starting point, not a
> line in the sand.

Really, no, to this.  Oauth2 is easy for people who have it and a right
royal pain for people who don't.  We're going to lose a mass of install
base for Keylime if we suddenly require oauth2.  Just leave
authentication up to the project; those which massive enterprises want
to use will likely get oauth2 as a choice, but mandating it as the only
option would generally make installation way more troublesome and kill
interest.

> The service doesn't need to be on, and in fact I think we want an
> offline tool and a service that wraps the tool in order to keep the
> functionality opt-in.
> 
> 2. request/response formats: I would recommend that responses use the
> standards effort in IETF RATS for a Conceptual Message Wrapper (CMW).
> Part of the challenge is to reduce the amount of variance in that
> wrapper. Roksana (CC'd) is trying to lead an effort for manufacturers
> to converge on a standard evidence format going forward, but an
> envelope is needed for now due to existing bespoke evidence formats.
> For the request, I think we should talk about ways to multiplex
> challenges out to configfs-tsm, TPM, workload attesters and the like.

OK, so RATS *model* fine: every current project does that.  RATS data
format: no because it's unnecessary.  RATS is a huge sprawling standard
and it tries to encompass a number of formats but realistically most
agent/server tools have their own internal wire format which they'd
either have to add to the RATS list or update to pick one.

> Given a standard request/response format, we may even get Microsoft
> to provide more access to the guest attestation service in their
> Windows offering?

It sounds like the desire is to have any client work with any server? 
That's going to be an interoperability nightmare and an ecosystem drag.
Just let the server deploy its own client and wait to see if the market
settles on a preferred one before trying to enforce something like
this.

> 3. extensibility: I think that each evidence collection technology
> should be a separately installed plugin to the daemon, and the daemon
> knows through configuration how to request evidence and store the
> result in the final CMW.

I think every current tool either has this or is heading towards it.

> 4. binary distribution: distributing the binary(ies) that collect
> evidence to include in the format is the nail biter. How do we build
> trust in which implementation to use?

Well I'm only really interested in open source.  If you want trusted
binaries in the attestation chain, then you have way more issues.  Plus
all of the project you listed below are open source, so I don't think
we even have to make a statement about proprietary.

>  This is where I think we would like to come together to produce an
> implementation under open governance and consortium support in the
> form of CCC or linux foundation or something. The goal of proposing a
> standard for evidence collection though is that other implementations
> would still be able to be used seamlessly in the remote attestation
> ecosystem.

Well, that's what all the projects are currently doing.  There doesn't
seem a need to forcibly pick one at this stage.

> 4b. trustworthiness: not to start a flame war (please), but I think
> there's a large contingent of folks that expect this tool to be
> written in Rust.

Lets not be pejorative about language; particularly as some of the
older servers are never going to be in rust even if they eventually
adopt a rust client.  Drawing such a line would simply start a flamewar
in the market place and be an adoption drag.

> I would ask that we keep the discussion of a single non-envelope
> evidence format to a separate forum, since we are trying to account
> for SEV-SNP, TDX, and TPM.

I think some tools are working towards supporting everything, but
that's by no means universal.  Trying to mandate that at this stage is
just going to produce another back reaction.  Lets see how the market
shakes out.  It could be that there will only be one universal tool
eventually because everything else is in a niche.

> 
> On that note, I will shout out different client/library
> implementation projects that I specifically hope would join the
> collective effort.
> 
> * go-configfs-tsm/go-sev-guest/go-tdx-guest/go-tpm-tools: All Google
> libraries with a client aspect that would be happy to switch to a
> standard client that more folks can easily include in their images.
> * Keylime: A TPM project that cares deeply about TPM quotes, yet also
> has the client problem.

what's "the client problem"?

> * cc-api/cc-trusted-api: An Intel project that provides a compelling
> interface, yet still is looking for collaboration to build collective
> trust in the project.

Is this DCAP or amber (now Intel Trust Authority)?  I'm guessing DCAP.

> * virtee: Mostly a SEV tool, but an open source community that cares
> about security and remote attestation
> * AMDESE/sev-guest: AMD's own tool for collecting a SEV-SNP
> attestation.

You missed Intel Amber, which is partly proprietary and the CoCo KBS.

> I'm sure James Bottomley has a specific suite of TPM tools to plug
> here, but I don't know them specifically. I've heard about client
> software on video calls but haven't learned the specifics.

Depends for what.  If you mean attestation, then no, most remote
attestation installations are settling on Keylime.  If you mean tooling
for key release and TPM policy coupling then yes we have an explosion.

> This is a lot of duplicated effort that makes negotiations with Linux
> distributions difficult. What packages should be included? I would
> hope a suite of packages under a single banner that we can all be
> happy with.

Do we even need distributions?  Red Hat is shipping Keylime, but we're
doing an Operator install to be more kubernetes like and to get away
from the distribution must ship this problem.

James

