Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1AD81AA2
	for <linux-coco@lists.linux.dev>; Tue, 23 Jan 2024 18:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706035491; cv=none; b=AP8yk+r/q8VWtfUbbD4mqBVEeGtwktGKZd+0X27zqgbP2Fdo9E2VWoLCNDUAgtH+GZxbZB6NF3L6y2X7kp0Cwoi1GRSyUCF7SZ+dgiuz+QJWeKrCm0LrLxA4bC544FrKCFELvKnhgAipajPZGivc4ltKBsB9cC1vrIyL/lsn/6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706035491; c=relaxed/simple;
	bh=lrCR1vBVWavKGNLtupI3WTgZmzw9VeDBZn63GtrWyj8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=U1RFYhic2bVw0bysCZayr3UZA5lAKnVLRYNoPF/sCzxJ83WRmdAxzw4Zuk5J3GtT+Ncz4tm8lWQEk90bv0iDL8bai2nKCzpFcaUnrcsPJJuewnDxzcS69hAMuJu2mV9cclQhzvbSFsP8IBW+BKn4k4CUDvvkg4TpmUwwRSn/X8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ilZ41R0R; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ilZ41R0R"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-55818b7053eso1779a12.0
        for <linux-coco@lists.linux.dev>; Tue, 23 Jan 2024 10:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706035487; x=1706640287; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iwz7teBJAbM5hRqIyAnU/YSMzh7V1k6xD5wTHYPZdK4=;
        b=ilZ41R0RNHOlIoH/qNzAhElMcJuWY3K837DcTwjIIpvhPckKnlUXEFxsNaA81LBtI3
         WOGSc65ubBzgp9m+9BG5EUjJui4XDICKTd49W0vrApjDmMFmAbM4HuVw9hQmS+IU+n1i
         q+jIOHlvmm1froBCFNPmJV2aeQ0Y2TdQkcO250pCfPOMQbdRcDy830QhM9Ko7qZm6JxI
         N/WIP5EmN/vxCl1FWpG/8mvKReFFkfuHxzWqSob/qoD+8yxBgOXH4yxxevxtmCqW3+e5
         6yWNUwHGe6VpV8GfqttndB/DOiSHYKC6I+WpuAljRRFxUX75xxCGtSQfiSEh7cxL9X0r
         8iXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706035487; x=1706640287;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iwz7teBJAbM5hRqIyAnU/YSMzh7V1k6xD5wTHYPZdK4=;
        b=NE+NlEovueZZBtt4ZWs+PVMoxZbCxiLizfSyqZNr2RrfKuNIB41ZBtJDmY42TlobRl
         doXqVz3+0OUnt2ZY45E6xWv7ivUhlSrBsQelniZsYoWKDuVasvOfZhhzm7ir24AsSVO5
         Qw8Sl3WVv16vVUB1cN9IkZuna3G7zhMSupIjoXUVwPTJzno5GXzic2D7V+qVIaeFjBZV
         yrv+o17DS9MIyDOpMpxUdqqZH7GP/YwXkUZvwdNP9mop5vGNN72reg7ZzzVAmbo7utRj
         vb9uknwtqJ+RF6lh/cAud63tOxK2SH24vC5oU5cdhqi0Auk9bvY7pcSXgTF4uqLI0v91
         cnMQ==
X-Gm-Message-State: AOJu0Yx85iNB0/0KhO0IkObZUokM1GXGXrCzo8+JYXbhhTRzuoLSsW1H
	53sgrf8AvHHwrX004ouuYFA1NSNdrXjQ8ogBLbo4so74Yv5HTcXq10SUl5yUd12gggFN89qRUTb
	31BHe+4IUHTp2c3545eRrqW9cM0g0mWWzmafkMJxBkZPpLaTD8VUg
X-Google-Smtp-Source: AGHT+IGFVgfFIxC+vKwAdCUc6d3nZm6tSXXea0PxhR1LDLiFSXhf7gJ6PWqOyXKaVGbDBWtyatVmfumBcxWhxzU47VA=
X-Received: by 2002:a05:6402:17cd:b0:558:8016:b347 with SMTP id
 s13-20020a05640217cd00b005588016b347mr39616edy.5.1706035487401; Tue, 23 Jan
 2024 10:44:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 23 Jan 2024 10:44:34 -0800
Message-ID: <CAAH4kHarATWGg6S9DGA9a+yvSgLGY417xf2AZGO0ae=f2Z2aKQ@mail.gmail.com>
Subject: Attestation evidence collection "standard package(s)" effort
To: linux-coco@lists.linux.dev, hannes.tschofenig@gmail.com, 
	Yogesh Deshpande <Yogesh.Deshpande@arm.com>, Thomas Fossati <thomas.fossati@linaro.org>, 
	Thomas Fossati <Thomas.Fossati@arm.com>, public@thson.de, 
	Jeff Andersen <jeffandersen@google.com>, Chong Cai <chongc@google.com>, 
	roksana.golizadeh.mojarad@intel.com, Dan Williams <dan.j.williams@intel.com>, 
	James Bottomley <jejb@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"

Hi all, I thought I'd start the conversation here about a concern I'm
hearing in various working groups. There are many software packages
folks are writing to provide in their VM guest images to gather
attestation reports and quotes, and no one feels they have a good
mandate to say "X package is what everyone ought to use" and that it
should be in most distributions' software repositories.

I'm not coming here with a suggested 15th tool that standardizes all
the other 14 standards, but to see what folks' requirements are such
that we can establish a concerted effort to solve them as a
collective. I still will suggest a concrete starting point to focus
the conversation.

The problem I think a large majority of us want to solve is how to
provide evidence to (possibly remote) requesters in a standard format.

Challenges:

1. authZN: who is allowed to gather evidence? To make attestation work
with a background check model (RFC9334) and seamlessly for users who
want "security sprinkles", the standard tool should be a daemon that
provides an evidence collection service for a standard protocol. I'd
recommend getting a tcp port assigned from the IANA and combining TLS
with OAuth 2.0 to pass "evidence challenge requests" to the server and
get evidence out. This is just a concrete starting point, not a line
in the sand.

The service doesn't need to be on, and in fact I think we want an
offline tool and a service that wraps the tool in order to keep the
functionality opt-in.

2. request/response formats: I would recommend that responses use the
standards effort in IETF RATS for a Conceptual Message Wrapper (CMW).
Part of the challenge is to reduce the amount of variance in that
wrapper. Roksana (CC'd) is trying to lead an effort for manufacturers
to converge on a standard evidence format going forward, but an
envelope is needed for now due to existing bespoke evidence formats.
For the request, I think we should talk about ways to multiplex
challenges out to configfs-tsm, TPM, workload attesters and the like.

Given a standard request/response format, we may even get Microsoft to
provide more access to the guest attestation service in their Windows
offering?

3. extensibility: I think that each evidence collection technology
should be a separately installed plugin to the daemon, and the daemon
knows through configuration how to request evidence and store the
result in the final CMW.

4. binary distribution: distributing the binary(ies) that collect
evidence to include in the format is the nail biter. How do we build
trust in which implementation to use? This is where I think we would
like to come together to produce an implementation under open
governance and consortium support in the form of CCC or linux
foundation or something. The goal of proposing a standard for evidence
collection though is that other implementations would still be able to
be used seamlessly in the remote attestation ecosystem.

4b. trustworthiness: not to start a flame war (please), but I think
there's a large contingent of folks that expect this tool to be
written in Rust.

I would ask that we keep the discussion of a single non-envelope
evidence format to a separate forum, since we are trying to account
for SEV-SNP, TDX, and TPM.

On that note, I will shout out different client/library implementation
projects that I specifically hope would join the collective effort.

* go-configfs-tsm/go-sev-guest/go-tdx-guest/go-tpm-tools: All Google
libraries with a client aspect that would be happy to switch to a
standard client that more folks can easily include in their images.
* Keylime: A TPM project that cares deeply about TPM quotes, yet also
has the client problem.
* cc-api/cc-trusted-api: An Intel project that provides a compelling
interface, yet still is looking for collaboration to build collective
trust in the project.
* virtee: Mostly a SEV tool, but an open source community that cares
about security and remote attestation
* AMDESE/sev-guest: AMD's own tool for collecting a SEV-SNP attestation.

I'm sure James Bottomley has a specific suite of TPM tools to plug
here, but I don't know them specifically. I've heard about client
software on video calls but haven't learned the specifics.

This is a lot of duplicated effort that makes negotiations with Linux
distributions difficult. What packages should be included? I would
hope a suite of packages under a single banner that we can all be
happy with.

-- 
-Dionna Glaze, PhD (she/her)
