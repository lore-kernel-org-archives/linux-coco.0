Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2AB20B1C
	for <linux-coco@lists.linux.dev>; Sat, 27 Jan 2024 22:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706395191; cv=none; b=G7o0EEGNW1vWBAnruYorBy1Gl8mraM6K5tetHFpHMlQk+1Ehvc5u+5KTxuJpbHS7k+Z8Q471f71yqrPaajO7OgbQGVB+L4z6iNxCLJPWNuy2nOAMhUgqdkYT+bCDjbTxvEmhfJHuG44OayM5EdtE0MjPrLb1vQCM547kYn4UCDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706395191; c=relaxed/simple;
	bh=YKYrACZlbCY6jYxxHYj85Qs+IqoxaFxf3ZNHBRDlHVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cvpeyYJFim8f2697s682mJZ3yJZyA1TbQX+0Jhs5UFz7/POZvJTQk8bwpDj+MDRuB775PDmNGjekiCq50Be8Eu+B1YanqLboEGcRtpIlmz+uR+h9tU6vYF9OgG62GmFD5m1knBQJaC26+O77+h4j+ca0ckkmdbVOb0SA8yhXoyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lRUPBDRf; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lRUPBDRf"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-55edfa70cbbso167a12.1
        for <linux-coco@lists.linux.dev>; Sat, 27 Jan 2024 14:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706395177; x=1706999977; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4LdS0qCW7AHTqxw/yru5EsgJb85q9SP6oyxPLz8i9jI=;
        b=lRUPBDRfU5WssVvkO2FZF4+Jp61yUYwBmqzje8atakgs9gGZ4GfzAm2IcEDxjaIKn7
         YqOvu7MUnVgDKTlU1ejnSOA5RqVNgvoXOPzQbem1GaiUEPn+rTveUsUiHq5vollUeh5p
         s2LGrZcM/ieIbpRat6Ol2B0ESXAtwguVpMqCIP17A2RUC0WfOMVuuVQHG8iTs0HjFRIK
         IFIegQokboshhC9LCFRQ9eZpnL77q29bX+YBHFYW63bIdHWWNVtdC4gnNxDkRg77VWGM
         V4vmFGntOsdIL3vQBurhtYsFEKltWgn1nnLui+MjIwGYqBCtlKAjI+9uBxIr/qmziy1B
         zEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706395177; x=1706999977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4LdS0qCW7AHTqxw/yru5EsgJb85q9SP6oyxPLz8i9jI=;
        b=s6VaPWYZaO/KGE0YKY+6V64IpUe2Ov/pL4Tf19QzUeLf+D06Q3G9FcSw1OjmHUef8X
         xBj7MxRgaWEfXa+qjYzQ3/O4oa9MAbhRcZztZmbyDVbVAl/8pez5C2YbBhfpL2Hdz7HK
         JBpplyom5K3lRAvcUUCVTviuViMVT0lFTy/2DUqRK3+n2Auurp7E8DxU0iL6tlrODIuZ
         iWvYipsyYAl4xdqpc3rlUtb68fapg6hy4EBICShYkSmubnP8YQOKZqyPYHO9MgjIXpRj
         +r9jGLJiV2ZwHHA/e28RHwoAeTRWcOpLlmmVCXoz0auqsCkrt2+wyFfmgF1ryU/DI7Gx
         To8w==
X-Gm-Message-State: AOJu0YyWs/fP51q5EfGnlkvbsaL1PPJZfgT5fJis1Fw4xcriXA7vwZYF
	1bmKTk4Dt7KX8vEQfPqw2rW03r+XY9d3LVISQBMhAu1mSxzbecY6inffXxUoRmhl7mkoukanmwb
	jWSfFUGRSNq/aZt0v6bJ/ndRJlEX18QG6FXZ3
X-Google-Smtp-Source: AGHT+IEfyRT/JNwwBKc5b9i6+srvvbrrS3Mr31klHdCqaWQmdINvQgnq3Ylld0st3nRwt6nITnveBiWkokyhJJPobZs=
X-Received: by 2002:a05:6402:3104:b0:55d:152:7d59 with SMTP id
 dc4-20020a056402310400b0055d01527d59mr329075edb.4.1706395177233; Sat, 27 Jan
 2024 14:39:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAAH4kHarATWGg6S9DGA9a+yvSgLGY417xf2AZGO0ae=f2Z2aKQ@mail.gmail.com>
 <9d601eaa42c3ecf659a5af74ab24a9bafc3c60ce.camel@linux.ibm.com>
In-Reply-To: <9d601eaa42c3ecf659a5af74ab24a9bafc3c60ce.camel@linux.ibm.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Sat, 27 Jan 2024 14:39:25 -0800
Message-ID: <CAAH4kHZLJn=wKwhPoYE=w1ikS__4gKfas-rucwf-gAKz9PtSdQ@mail.gmail.com>
Subject: Re: Attestation evidence collection "standard package(s)" effort
To: jejb@linux.ibm.com
Cc: linux-coco@lists.linux.dev, hannes.tschofenig@gmail.com, 
	Yogesh Deshpande <Yogesh.Deshpande@arm.com>, Thomas Fossati <thomas.fossati@linaro.org>, 
	Thomas Fossati <Thomas.Fossati@arm.com>, public@thson.de, 
	Jeff Andersen <jeffandersen@google.com>, Chong Cai <chongc@google.com>, 
	roksana.golizadeh.mojarad@intel.com, Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 27, 2024 at 8:29=E2=80=AFAM James Bottomley <jejb@linux.ibm.com=
> wrote:
>
> On Tue, 2024-01-23 at 10:44 -0800, Dionna Amalie Glaze wrote:
> > Hi all, I thought I'd start the conversation here about a concern I'm
> > hearing in various working groups. There are many software packages
> > folks are writing to provide in their VM guest images to gather
> > attestation reports and quotes, and no one feels they have a good
> > mandate to say "X package is what everyone ought to use" and that it
> > should be in most distributions' software repositories.
> >
> > I'm not coming here with a suggested 15th tool that standardizes all
> > the other 14 standards, but to see what folks' requirements are such
> > that we can establish a concerted effort to solve them as a
> > collective. I still will suggest a concrete starting point to focus
> > the conversation.
> >
> > The problem I think a large majority of us want to solve is how to
> > provide evidence to (possibly remote) requesters in a standard
> > format.
> >
> > Challenges:
> >
> > 1. authZN: who is allowed to gather evidence? To make attestation
> > work with a background check model (RFC9334) and seamlessly for users
> > who want "security sprinkles", the standard tool should be a daemon
> > that provides an evidence collection service for a standard protocol.
> > I'd recommend getting a tcp port assigned from the IANA and combining
> > TLS with OAuth 20 to pass "evidence challenge requests" to the server
> > and get evidence out. This is just a concrete starting point, not a
> > line in the sand.
>
> Really, no, to this.  Oauth2 is easy for people who have it and a right
> royal pain for people who don't.  We're going to lose a mass of install
> base for Keylime if we suddenly require oauth2.  Just leave
> authentication up to the project; those which massive enterprises want
> to use will likely get oauth2 as a choice, but mandating it as the only
> option would generally make installation way more troublesome and kill
> interest.
>

Fair enough, though I would at least want to have request/response
formats that the service ought to make evidence collection easier to
simply forward through an existing service, like a Certificate
Authority Service can have a gRPC API that consumes certificate
signing requests (CSRs) in a well-defined format and returns x.509
certificates in a well-defined format. The gRPC API and API
authorization system is separate.

> > The service doesn't need to be on, and in fact I think we want an
> > offline tool and a service that wraps the tool in order to keep the
> > functionality opt-in.
> >
> > 2. request/response formats: I would recommend that responses use the
> > standards effort in IETF RATS for a Conceptual Message Wrapper (CMW).
> > Part of the challenge is to reduce the amount of variance in that
> > wrapper. Roksana (CC'd) is trying to lead an effort for manufacturers
> > to converge on a standard evidence format going forward, but an
> > envelope is needed for now due to existing bespoke evidence formats.
> > For the request, I think we should talk about ways to multiplex
> > challenges out to configfs-tsm, TPM, workload attesters and the like.
>
> OK, so RATS *model* fine: every current project does that.  RATS data
> format: no because it's unnecessary.  RATS is a huge sprawling standard
> and it tries to encompass a number of formats but realistically most
> agent/server tools have their own internal wire format which they'd
> either have to add to the RATS list or update to pick one.
>

RATS is a collection of working groups working on different standard
formats for different aspects of the framework in RFC9334, so I don't
see why that collective work ought to be thrown out.
Yes, we're all doing our own thing *right now* but can we talk about
converging on standards? A request for evidence can't be that hard of
a format to propose and stick to, right? Request evidence from all
registered attesters with challenge C, respond with a CMW, no?

> > Given a standard request/response format, we may even get Microsoft
> > to provide more access to the guest attestation service in their
> > Windows offering?
>
> It sounds like the desire is to have any client work with any server?
> That's going to be an interoperability nightmare and an ecosystem drag.

The attestation technologies are well-defined up until user space. We
have the hardware attestation reports, TPM quote + event log, CCEL for
RTMR-based technologies, Linux IMA event log for kernel boot, dmverity
for initramfs integrity. We don't have much consensus on "workload"
since that's really a platform-specific thing. Everything is going to
have a report and optional event log that the report provides
integrity over. The requests will include challenges to prove
freshness. I don't think it's an impossible task to define and adhere
to a standard that can request evidence and respond with an envelope
containing a list of attesters' evidences.

A "drag" to slow down and think about the commonality is I think part
of the ask here. Dan asked for folks to slow down on ioctl-based
attestation and now we have configfs-tsm. Can we not talk about
generalizing past the one report to a collection of reports?

> Just let the server deploy its own client and wait to see if the market
> settles on a preferred one before trying to enforce something like
> this.
>

I don't think a market force argument works here due to the power held
by Microsoft with Windows attestation. CSPs have verifier services and
clients already, it's a pain for folks to onboard, and Windows on
Azure AFAICT gives the user no option to collect an attestation report
at all=E2=80=93it's all through a proprietary guest service. There's no rea=
l
chance for middleware solutions to close the multi-cloud evidence
client gap. If I could add support for unenlightened guests right now
and run Windows under Coconut-SVSM, there would be no way for users to
federate with a different verifier service.
Coming back to Linux, then, if we look at AWS, they don't have an
attestation service. GCP does have an attestation service, but it's
custom-built for Confidential Space since we have control over the
guest image Container-optimized OS (COS). For folks to bring their own
image, they need to install the client we released on
github.com/google/go-tpm-tools and send evidence to the server, but
that's not particularly useful for downstream users to request their
own evidence challenge of the service. There's zero uniformity even on
a single cloud, which is why I brought up a standard tcp port and
protocol.

> > 3. extensibility: I think that each evidence collection technology
> > should be a separately installed plugin to the daemon, and the daemon
> > knows through configuration how to request evidence and store the
> > result in the final CMW.
>
> I think every current tool either has this or is heading towards it.
>
> > 4. binary distribution: distributing the binary(ies) that collect
> > evidence to include in the format is the nail biter. How do we build
> > trust in which implementation to use?
>
> Well I'm only really interested in open source.  If you want trusted
> binaries in the attestation chain, then you have way more issues.  Plus

Yes? What is the issue with wanting to have a measured binary for your
evidence-collection daemon that has privileged access to attestation
evidence?
We want to have software->binary provenance attestations for every
binary that runs in the target environment. Indeed our build systems
already provide such signed provenances. The issue just becomes the
analysis of event logs to find the provenances by digest, which is a
solvable information retrieval problem for an attestation verification
service.

> all of the project you listed below are open source, so I don't think
> we even have to make a statement about proprietary.
>

I'm making no statements about proprietary. I'm making statements
about trusted builders that attest to auditable provenances. To me,
remote attestation means nothing unless every bit can be tied back to
source that auditors have read access to. The best audit access for me
as a virtual firmware and VM image provider is open source, but
different access for different folks as fit to their needs.

> >  This is where I think we would like to come together to produce an
> > implementation under open governance and consortium support in the
> > form of CCC or linux foundation or something. The goal of proposing a
> > standard for evidence collection though is that other implementations
> > would still be able to be used seamlessly in the remote attestation
> > ecosystem.
>
> Well, that's what all the projects are currently doing.  There doesn't
> seem a need to forcibly pick one at this stage.
>

I hope this thread doesn't come off as forcing. I see a lot of
duplicated work and hear a lot of complaints about how hard it is for
each bespoke implementation to get mindshare. We're doing okay with
advising folks to use go-tpm-tools to collect evidence, and we can use
our influence to get its client CLI packaged into a few distros, but
it's not a complete solution. When it comes to remotely requesting
evidence, there's a lot more variance.

> > 4b. trustworthiness: not to start a flame war (please), but I think
> > there's a large contingent of folks that expect this tool to be
> > written in Rust.
>
> Lets not be pejorative about language; particularly as some of the
> older servers are never going to be in rust even if they eventually
> adopt a rust client.  Drawing such a line would simply start a flamewar
> in the market place and be an adoption drag.
>

Yes, and for the non-server piece that just interacts with the kernel
to gather evidence, the implementations are all new and small.
Apologies for going here.

> > I would ask that we keep the discussion of a single non-envelope
> > evidence format to a separate forum, since we are trying to account
> > for SEV-SNP, TDX, and TPM.
>
> I think some tools are working towards supporting everything, but
> that's by no means universal.  Trying to mandate that at this stage is
> just going to produce another back reaction.  Lets see how the market
> shakes out.  It could be that there will only be one universal tool
> eventually because everything else is in a niche.
>
> >
> > On that note, I will shout out different client/library
> > implementation projects that I specifically hope would join the
> > collective effort.
> >
> > * go-configfs-tsm/go-sev-guest/go-tdx-guest/go-tpm-tools: All Google
> > libraries with a client aspect that would be happy to switch to a
> > standard client that more folks can easily include in their images.
> > * Keylime: A TPM project that cares deeply about TPM quotes, yet also
> > has the client problem.
>
> what's "the client problem"?
>

Getting mindshare for an evidence collection package that VM image
creators are confident shipping pre-installed for confidential
computing workloads.

> > * cc-api/cc-trusted-api: An Intel project that provides a compelling
> > interface, yet still is looking for collaboration to build collective
> > trust in the project.
>
> Is this DCAP or amber (now Intel Trust Authority)?  I'm guessing DCAP.
>

DCAP is more about verification. I'm only talking about evidence
collection, which is dependent only on the hardware technologies and
the guest kernel support for them. The cc-trusted-api project has rust
and python implementations for collecting event logs and attestation
reports from various attestation technologies, and it's pretty clean
given my audit of its sources. There's just no TPM or CCA support
(they're todo!()) or a CLI with serialized request/response format.
Still I like what I see as promising. If not as an implementation to
flock to, at least as a good API design:
https://github.com/cc-api/cc-trusted-api?tab=3Dreadme-ov-file#3-apis

> > * virtee: Mostly a SEV tool, but an open source community that cares
> > about security and remote attestation
> > * AMDESE/sev-guest: AMD's own tool for collecting a SEV-SNP
> > attestation.
>
> You missed Intel Amber, which is partly proprietary and the CoCo KBS.
>

Does amber have a client? I have been well ignorant of the container
world unfortunately. Thanks for pointing me there. Yes I would say
that https://github.com/confidential-containers/guest-components is a
good project to add to the list.

> > I'm sure James Bottomley has a specific suite of TPM tools to plug
> > here, but I don't know them specifically. I've heard about client
> > software on video calls but haven't learned the specifics.
>
> Depends for what.  If you mean attestation, then no, most remote
> attestation installations are settling on Keylime.  If you mean tooling
> for key release and TPM policy coupling then yes we have an explosion.
>

Not key release, just evidence collection.

> > This is a lot of duplicated effort that makes negotiations with Linux
> > distributions difficult. What packages should be included? I would
> > hope a suite of packages under a single banner that we can all be
> > happy with.
>
> Do we even need distributions?  Red Hat is shipping Keylime, but we're
> doing an Operator install to be more kubernetes like and to get away
> from the distribution must ship this problem.
>

Okay, that seems fair enough. I'm less connected to our GKE team and
still trying to solve the general GCE attestation problem.

> James
>


--
-Dionna Glaze, PhD (she/her)
