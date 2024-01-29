Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048861586D9
	for <linux-coco@lists.linux.dev>; Mon, 29 Jan 2024 21:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706563800; cv=none; b=TWFbqmkW9pyFnFet3tKCv3Dqc0GghoD9fXGd9gHcFJVDPLvgsEcmc5UvU10WVsrjYWmA6rg89HW6KcZdJmVJ0WyV6/kJRfrsoBXvwu7oKy1q4GImsjCM306SuAwmSQmGF8PSURQ6cofLjk8ARfRxacDCd49h4rb1sF3YfvTcWcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706563800; c=relaxed/simple;
	bh=R/qfNiXTv2N9HGs4lSLOpfLdLa1Zwp/InkNyhHxbR9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o9U/HZ0aF6uytj+Y+h72spO++rKdq0EDojgodde9YZ8oNuOrolPn/jP7VoPL1axHeqiNSyHL/Q8FJj5XQZx+49Mp4LsaZ5A5k/1kSReBqwlBTIklOnvUJd0zDYe/LkbLS81N883Tc9w31PvquVfc38oabx6p9ii6Ki+Icu3Q4Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BQx+K0tR; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BQx+K0tR"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5100ed2b33dso5087982e87.0
        for <linux-coco@lists.linux.dev>; Mon, 29 Jan 2024 13:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706563796; x=1707168596; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ha2t06w7G7xfEplFUppPttGXh4Et97UIC5EmuOQOdN4=;
        b=BQx+K0tRUGDF8ZfS0Lh7ZRqSyplWInSg2GP/fbtrFuvoowmYpJLT/HmdyqkYsmO6nN
         4ubPdboSZqtxtJf2ckz5XQHLkFfrnku+HL/GXP/GLt6W9g61I/unu9PU09tQrbtM7f1E
         ot84FesdrugWDkgRNrZOqEuVnTRZdeAKZnQ9nSKZ7bq8/x66MUPjB6VqztL/eRJv6NFO
         4geOlNS5OyuuPKjuopUxawSnoL+jy/xzPJUOzfgkSiPK7NnyuRwrh9yW80UiuXpY9tOf
         eZYGIt+OOiRWzTGUlRNm1Revuhm6w8lEC7m9/o9sU5eALJ+HxNTVoPOWYOTUIAfV7b+H
         w6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706563796; x=1707168596;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ha2t06w7G7xfEplFUppPttGXh4Et97UIC5EmuOQOdN4=;
        b=IU7EdiycGmrWTg6QuVeT7GwZT0MeiQ1o1KoPpwRPWTfKJ6S+GYyOLK3D4jIzYJ9XpV
         HSZo7TAiWUl9D7joztPxzh5g7+uIqjg5J0Qvoc9bbRQ6OOr5Nk1YEf1bgtX58ir2qRtx
         elGxP2BVpU1FAs8fN3PLIYZx5lWWEhoTmN4Pv+w1etdBWb6GVleyT0bTYecCyEZDSMrn
         3/WewDglrN2kK5RJbXKrnpJ4ycBk+s0sM4ucCE3OQe6/iNOnOYmS3NGmEvo2q4yf1NNj
         H5oC625y4sUnpwFztnNOqJ7phZE7jjGs2uckQKWSNPo4TbNmQA3OfHq35+Is3Y3hQEFc
         vjEg==
X-Gm-Message-State: AOJu0YzmySY7oVGt12gMozUcrQ6fyLDu7GTLiyupf5mkwQTgDQ7qhIyZ
	FZpKCSR+S3DtHwpDGqt0mCBHizNnL+lUZfORALijrQkHlamRM0Uz/J1E1gR926QvdOJo57zmKO3
	h4Pgcdm9IQ4R+mfI7HuGwrey1z0ln/JCPb2vvkg==
X-Google-Smtp-Source: AGHT+IEuP4lIvdQ+N/9EqmaZ329uA30uokXMhTKlE6dn/1Y0SI0XVZscgOH848B8Ak8uVw6qtsMtk3sJ9LkQf/FWxpw=
X-Received: by 2002:a05:6512:3b0e:b0:50e:db6c:f014 with SMTP id
 f14-20020a0565123b0e00b0050edb6cf014mr5604926lfv.48.1706563796022; Mon, 29
 Jan 2024 13:29:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAAH4kHarATWGg6S9DGA9a+yvSgLGY417xf2AZGO0ae=f2Z2aKQ@mail.gmail.com>
In-Reply-To: <CAAH4kHarATWGg6S9DGA9a+yvSgLGY417xf2AZGO0ae=f2Z2aKQ@mail.gmail.com>
From: Thomas Fossati <thomas.fossati@linaro.org>
Date: Mon, 29 Jan 2024 22:29:39 +0100
Message-ID: <CA+1=6yeCahoFu6504c5wH92xpZe66-=QtSvY9xLedA-SJSU-Jg@mail.gmail.com>
Subject: Re: Attestation evidence collection "standard package(s)" effort
To: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: linux-coco@lists.linux.dev, hannes.tschofenig@gmail.com, 
	Yogesh Deshpande <Yogesh.Deshpande@arm.com>, Thomas Fossati <Thomas.Fossati@arm.com>, public@thson.de, 
	Jeff Andersen <jeffandersen@google.com>, Chong Cai <chongc@google.com>, 
	roksana.golizadeh.mojarad@intel.com, Dan Williams <dan.j.williams@intel.com>, 
	James Bottomley <jejb@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Jan 2024 at 19:44, Dionna Amalie Glaze
<dionnaglaze@google.com> wrote:
> The problem I think a large majority of us want to solve is how to
> provide evidence to (possibly remote) requesters in a standard format.

+1

> Challenges:
>
> 1. authZN: who is allowed to gather evidence? To make attestation work
> with a background check model (RFC9334) and seamlessly for users who
> want "security sprinkles", the standard tool should be a daemon that
> provides an evidence collection service for a standard protocol. I'd
> recommend getting a tcp port assigned from the IANA and combining TLS
> with OAuth 2.0 to pass "evidence challenge requests" to the server and
> get evidence out. This is just a concrete starting point, not a line
> in the sand.

Authentication of the requester is the requirement.  I am happy with
whatever protocol does the job.  There's probably going to be more
than one, and we should treat it as a configuration choice.

> 2. request/response formats: I would recommend that responses use the
> standards effort in IETF RATS for a Conceptual Message Wrapper (CMW).
> Part of the challenge is to reduce the amount of variance in that
> wrapper. Roksana (CC'd) is trying to lead an effort for manufacturers
> to converge on a standard evidence format going forward, but an
> envelope is needed for now due to existing bespoke evidence formats.
> For the request, I think we should talk about ways to multiplex
> challenges out to configfs-tsm, TPM, workload attesters and the like.

+1

> 3. extensibility: I think that each evidence collection technology
> should be a separately installed plugin to the daemon, and the daemon
> knows through configuration how to request evidence and store the
> result in the final CMW.

+1

> 4. binary distribution: distributing the binary(ies) that collect
> evidence to include in the format is the nail biter. How do we build
> trust in which implementation to use? This is where I think we would
> like to come together to produce an implementation under open
> governance and consortium support in the form of CCC or linux
> foundation or something. The goal of proposing a standard for evidence
> collection though is that other implementations would still be able to
> be used seamlessly in the remote attestation ecosystem.

I think it would be a great fit for the Attestation SIG in the CCC.
It's the right demographic profile, and I'd be happy to help
facilitate the discussion if you decide to present it there.

> 4b. trustworthiness: not to start a flame war (please), but I think
> there's a large contingent of folks that expect this tool to be
> written in Rust.

Yes, though I reckon Go would be an acceptable option too.

> I would ask that we keep the discussion of a single non-envelope
> evidence format to a separate forum, since we are trying to account
> for SEV-SNP, TDX, and TPM.
>
> On that note, I will shout out different client/library implementation
> projects that I specifically hope would join the collective effort.
>
> * go-configfs-tsm/go-sev-guest/go-tdx-guest/go-tpm-tools: All Google
> libraries with a client aspect that would be happy to switch to a
> standard client that more folks can easily include in their images.
> * Keylime: A TPM project that cares deeply about TPM quotes, yet also
> has the client problem.
> * cc-api/cc-trusted-api: An Intel project that provides a compelling
> interface, yet still is looking for collaboration to build collective
> trust in the project.
> * virtee: Mostly a SEV tool, but an open source community that cares
> about security and remote attestation
> * AMDESE/sev-guest: AMD's own tool for collecting a SEV-SNP attestation.

Since CMW [1] was mentioned twice:
+ veraison/cmw [2]: reference implementation in Go

[1] https://www.ietf.org/archive/id/draft-ietf-rats-msg-wrap-02.html
[2] https://github.com/veraison/cmw
