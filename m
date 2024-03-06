Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB07E5DF3B
	for <linux-coco@lists.linux.dev>; Wed,  6 Mar 2024 09:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709718662; cv=none; b=PQE2F+9HBGSVXlxc2P93PFHNzDn4ANdS7GA/HoOrl3q4+AKORutg2uCPqRP/spY6sNiauLCJ5er+SiM/kejsaLpE2/dN87eaE6dh9flfVlWwkIeLGVJNlIYhc+U1ctS0NvXLwYByqE96Jal7uJjsjcl4t3tuHXaYQb1niVTgQes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709718662; c=relaxed/simple;
	bh=KavUYNL0vg8zTxSDj7cOieISMm3nP7lImiQRkTXhBQk=;
	h=Mime-Version:Subject:From:In-Reply-To:Date:Cc:Message-Id:
	 References:To:Content-Type; b=d7TSdCkEla9TmyCFSwbaR96+j2jRVWidUdUylwG5o373pyrbm4M2AnBPYY+7ayEQLW+OYdSnOECeTQnqvTqx2N/4KFEhvLMy/NZgEmd/lrl8tFdXu7M5ttaLXhRwmr3ONkyDE/ORpvjStcOlOOBAYPbpJID6Y+FDab5cKYfBQAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EwATJNbi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EwATJNbi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709718659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KavUYNL0vg8zTxSDj7cOieISMm3nP7lImiQRkTXhBQk=;
	b=EwATJNbiAJMGJJIHVRu5MZ3SMju4Bxb2dC3fEx1YjeadUZERnJxNvynqAbOtUutiZxal2h
	QAdivIu/XXyYT5K8+ll3tlrX013OdNqHxD9uI9iEFSnBNvOrAQOcWLnOyh7DtVezITu3C/
	9Qtck5IKCC82AKzIOE0FBOMmT3gHKO8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-O6H6SN_nNMmUqP2Qu8kR4Q-1; Wed, 06 Mar 2024 04:50:58 -0500
X-MC-Unique: O6H6SN_nNMmUqP2Qu8kR4Q-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-78838d1b9d3so147824885a.2
        for <linux-coco@lists.linux.dev>; Wed, 06 Mar 2024 01:50:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709718657; x=1710323457;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+i09dqsyxU0lLpjXIkXA9l0EtTB8uFfHBnkC29NIGLw=;
        b=ovy24w2FnmPx1IpGDNm7k37EkSgtzhw3EWPPLYcIr6ibbt2ZGoVdnSzUIVWD0LCHEx
         BzSXVCyRGo8f4ATB1ELyCk8iv6Y7VZ1BltalZw5QiqtJELiC3pfGKjjnEHmiXkBZK87K
         kz++nBTejo6X62p5ItW6Rg5surv7GcYfAg0HxhZW4CxjVEhox9eatcXNw+AxElYxkGHB
         iPPffVnf3G0hTqAz5u5auBmS7U0IfTPz4Qhznd8eDAKSd8evu4Cebwnqk1pxc/PIDb+E
         5NgeibSOUzLVNRWVNkjlM7CRxoYCOHO7o+gg7AUIV1X8MRQbev5EA3WFcgzREPNLPKfw
         5UsQ==
X-Gm-Message-State: AOJu0YzkjieNvsIeolJW7LS2dFK6fiKImr4Xdbps/C5121Jlm454W/jX
	s7AfYnRZeATKpN9beyFpROXKlNHgRASWh4bYpD+ydZDuF1hRytlSNR7IPmp6fNStV1skbitIK6q
	Ew4b3ms7rL+pCrkBdIOxetFdJNATgSzkEGkzygQYLVKg7jwufSYL/1aoaFMk=
X-Received: by 2002:a05:620a:3b8c:b0:788:3187:f33c with SMTP id ye12-20020a05620a3b8c00b007883187f33cmr4347989qkn.13.1709718657608;
        Wed, 06 Mar 2024 01:50:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUovROxDGiVwr5VJqtqQiZ9ajx+bsGsY07Aox+QCR5vLoRUTLwzBUct/5a7qbZJLjP2u+DTg==
X-Received: by 2002:a05:620a:3b8c:b0:788:3187:f33c with SMTP id ye12-20020a05620a3b8c00b007883187f33cmr4347964qkn.13.1709718657192;
        Wed, 06 Mar 2024 01:50:57 -0800 (PST)
Received: from smtpclient.apple ([2a01:e0a:834:5aa0:6da9:fe4e:7c37:1f7a])
        by smtp.gmail.com with ESMTPSA id t8-20020a05620a0b0800b00788406f9c7dsm307352qkg.101.2024.03.06.01.50.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Mar 2024 01:50:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: Attestation evidence collection "standard package(s)" effort
From: Christophe de Dinechin <cdupontd@redhat.com>
In-Reply-To: <7440d664-0004-42d4-9067-f6ce79cc1f5b.zhangjiale@linux.alibaba.com>
Date: Wed, 6 Mar 2024 10:50:43 +0100
Cc: linux-coco <linux-coco@lists.linux.dev>,
 dionnaglaze <dionnaglaze@google.com>,
 "hannes.tschofenig" <hannes.tschofenig@gmail.com>,
 "Yogesh.Deshpande" <Yogesh.Deshpande@arm.com>,
 "thomas.fossati" <thomas.fossati@linaro.org>,
 "Thomas.Fossati" <Thomas.Fossati@arm.com>,
 public <public@thson.de>,
 jeffandersen <jeffandersen@google.com>,
 chongc <chongc@google.com>,
 "roksana.golizadeh.mojarad" <roksana.golizadeh.mojarad@intel.com>,
 "dan.j.williams" <dan.j.williams@intel.com>,
 jejb <jejb@linux.ibm.com>
Message-Id: <436AD60D-C990-436C-B964-5BB5B8828476@redhat.com>
References: <7440d664-0004-42d4-9067-f6ce79cc1f5b.zhangjiale@linux.alibaba.com>
To: zhangjiale <zhangjiale@linux.alibaba.com>
X-Mailer: Apple Mail (2.3774.400.31)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> On 6 Mar 2024, at 08:32, zhangjiale <zhangjiale@linux.alibaba.com> wrote:
>=20
> Dionna Amalie Glaze wrote:=20
>> Hi all, I thought I'd start the conversation here about a concern I'm
>> hearing in various working groups. There are many software packages
>> folks are writing to provide in their VM guest images to gather
>> attestation reports and quotes, and no one feels they have a good
>> mandate to say "X package is what everyone ought to use" and that it
>> should be in most distributions' software repositories.
>>=20
>> I'm not coming here with a suggested 15th tool that standardizes all
>> the other 14 standards, but to see what folks' requirements are such
>> that we can establish a concerted effort to solve them as a
>> collective. I still will suggest a concrete starting point to focus
>> the conversation.
>>=20
>> The problem I think a large majority of us want to solve is how to
>> provide evidence to (possibly remote) requesters in a standard format.
>> =20
>> Challenges:
>>=20
>> 1. authZN: who is allowed to gather evidence? To make attestation work
>> with a background check model (RFC9334) and seamlessly for users who
>> want "security sprinkles", the standard tool should be a daemon that
>> provides an evidence collection service for a standard protocol. I'd
>> recommend getting a tcp port assigned from the IANA and combining TLS
>> with OAuth 2.0 to pass "evidence challenge requests" to the server and
>> get evidence out. This is just a concrete starting point, not a line
>> in the sand.
>>=20
>> The service doesn't need to be on, and in fact I think we want an
>> offline tool and a service that wraps the tool in order to keep the
>> functionality opt-in.
>>=20
>> 2. request/response formats: I would recommend that responses use the
>> standards effort in IETF RATS for a Conceptual Message Wrapper (CMW).
>> Part of the challenge is to reduce the amount of variance in that
>> wrapper. Roksana (CC'd) is trying to lead an effort for manufacturers
>> to converge on a standard evidence format going forward, but an
>> envelope is needed for now due to existing bespoke evidence formats.
>> For the request, I think we should talk about ways to multiplex
>> challenges out to configfs-tsm, TPM, workload attesters and the like.
>>=20
>> Given a standard request/response format, we may even get Microsoft to
>> provide more access to the guest attestation service in their Windows
>> offering?
>>=20
>> 3. extensibility: I think that each evidence collection technology
>> should be a separately installed plugin to the daemon, and the daemon
>> knows through configuration how to request evidence and store the
>> result in the final CMW.
>>=20
>> 4. binary distribution: distributing the binary(ies) that collect
>> evidence to include in the format is the nail biter. How do we build
>> trust in which implementation to use? This is where I think we would
>> like to come together to produce an implementation under open
>> governance and consortium support in the form of CCC or linux
>> foundation or something. The goal of proposing a standard for evidence
>> collection though is that other implementations would still be able to
>> be used seamlessly in the remote attestation ecosystem.
>>=20
>> 4b. trustworthiness: not to start a flame war (please), but I think
>> there's a large contingent of folks that expect this tool to be
>> written in Rust.
>>=20
>> I would ask that we keep the discussion of a single non-envelope
>> evidence format to a separate forum, since we are trying to account
>> for SEV-SNP, TDX, and TPM.
>>=20
>> On that note, I will shout out different client/library implementation
>> projects that I specifically hope would join the collective effort.
>>=20
>> * go-configfs-tsm/go-sev-guest/go-tdx-guest/go-tpm-tools: All Google
>> libraries with a client aspect that would be happy to switch to a
>> standard client that more folks can easily include in their images.
>> * Keylime: A TPM project that cares deeply about TPM quotes, yet also
>> has the client problem.
>> * cc-api/cc-trusted-api: An Intel project that provides a compelling
>> interface, yet still is looking for collaboration to build collective
>> trust in the project.
>> * virtee: Mostly a SEV tool, but an open source community that cares
>> about security and remote attestation
>> * AMDESE/sev-guest: AMD's own tool for collecting a SEV-SNP attestation.
>>=20
>> I'm sure James Bottomley has a specific suite of TPM tools to plug
>> here, but I don't know them specifically. I've heard about client
>> software on video calls but haven't learned the specifics.
>>=20
>> This is a lot of duplicated effort that makes negotiations with Linux
>> distributions difficult. What packages should be included? I would
>> hope a suite of packages under a single banner that we can all be
>> happy with.
>> --=20
>> -Dionna Glaze, PhD (she/her)
>=20
>=20
>=20
>=20
> Hi, Dionna. Glad to see this proposal.
>=20
>=20
> I would like to recommend an open-source component that has made
> considerable efforts toward unifying TEE evidence provision: attestation-=
agent.
> (https://github.com/confidential-containers/guest-components/tree/main/at=
testation-agent)
>=20
>=20
> This component is currently implemented under the Confidential Containers
> (CNCF Sandbox project), but it is not customized for Confidential Contain=
ers.
> It is a completely universal component that focuses on Attestation.

Agree. For what it's worth, we have been looking at this component for atte=
station in a confidential cluster context as well, where there are slightly=
 different requirements for attestation.

>=20
>=20
> The current implementation of the Attestation Agent is:
>=20
>=20
> 1. A fully Rust written daemon service that supports listening to specifi=
ed
> TCP ports or UNIX socket in the form of gRPC/ttRPC.
>=20
>=20
> 2. Each evidence collection technique is implemented as a plugin that
> can be installed at compile time, and currently supports six different
> platforms=E2=80=98 evidence collection techniques (tsm-configfs support i=
s currently in=20
> a pull request (PR)).
>=20
>=20
> 3. Use JSON-wrapped serialized strings for request and response formats.
>=20
>=20
> 4. In addition to providing evidence, it can also support connecting to r=
emote
> attestation services to obtain reports or tokens of evidence verification=
 results.
>=20
> Here is the declaration of the API provided by Attestation Agent:
> https://github.com/confidential-containers/guest-components/blob/main/att=
estation-agent/protos/attestation-agent.proto
>=20
>=20
> I think that the implementation direction of this open-source component i=
s
> largely consistent with the expectations you mentioned in your proposal,
> and its maintainers now hope to further develop and distribute this compo=
nent
> in some form in more upstream communities (such as CCC).
>=20
>=20
> We hope to work together with you and the other open-source projects
> you mentioned to achieve the ultimate goal of unification.
> --=20
> - Jiale Zhang
>=20
>=20
>=20
>=20
>=20
>=20
>=20

