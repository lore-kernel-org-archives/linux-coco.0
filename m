Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F70D30C
	for <linux-coco@lists.linux.dev>; Wed,  3 May 2023 15:24:22 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1aaf702c3ccso229315ad.1
        for <linux-coco@lists.linux.dev>; Wed, 03 May 2023 08:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683127462; x=1685719462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ppzeMdhiV7rhaW44wktBcr2kF59czLwUT+cf4/SlfII=;
        b=JM6XxGM2nLdy1CXx3NMururjPfM+NYvY2A/W6DbkkvzpaVslRIcN4gyzM8bhiFyfXz
         wEUcc69EoSheXuwpisXmO0eG9oxusnAVtZXIKRjo0Vc/kOK3WodESJlebo2vsR7JmoKA
         Uzn8VVLZ0B/NnoBbsIaDVYjk5FRNxm+pU9E3rDFbKLe8El6F5uTEOSxc93t91cC7MyJJ
         CBPQG8Qg0j2suHDDzeEVA+JlLViMLwd5PSpWtkzSw3lupF/HPBuRLf8iMCOFnujQfFAf
         lptCBvWFjQTD4PwgaylpwdpYaTObNGLZ3LJ7CqBSqKIrLSvbj4yxJ9yyBQ6Ut0beZR1x
         uNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683127462; x=1685719462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ppzeMdhiV7rhaW44wktBcr2kF59czLwUT+cf4/SlfII=;
        b=fumF2HXyRWbfNLTZ4wHyxtso9S+smvW1EoC5xrvtt8T907QXDEQvaJ191YNyHU32Fx
         xJoVr3wWemdYV2tbFWCLga82fi2NqdiOXGi4/b7HNdgtLGGJpQa/vCTh0Oer7g91j0/L
         CZRXBsFfQmvk2/UrJEkuDF+pj6zvQo/UVzB1A0u3Y47qw7uDwJDMxlZ1tOh0mGCakyGK
         uEG9Q7FDkMp9u+SBAAyqly9jCz4yMk66RyAbhErJY3opB4aPNCLKWjaKsTgu/0QacGs/
         uly3ZqQ8pCkvUKP5jQATwyXeQI9MVVDIgn8BqwSqSkyWtRipcRNO+Xrxc941l/FIhciq
         bi5w==
X-Gm-Message-State: AC+VfDxn3RYz4p45WVFJRgH43stCtrE+feZxS64QcaNrg2iPXukchvRL
	D/6h66mqgAqEw/rfhsRUNPZm1OyXBe1l5mPxalk8JA==
X-Google-Smtp-Source: ACHHUZ4OJRDdOPFrpeAtv6Hp1BYOCyh6YTmP4rDtZYgKcR60wIT7RhBalh0CGiIWBM4HRIev2+idJfohuYpn1BfCmEc=
X-Received: by 2002:a17:902:ce8b:b0:1a6:760c:af3d with SMTP id
 f11-20020a170902ce8b00b001a6760caf3dmr286590plg.16.1683127462101; Wed, 03 May
 2023 08:24:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZBl4592947wC7WKI@suse.de> <4420d7e5-d05f-8c31-a0f2-587ebb7eaa20@amd.com>
 <ZFJTDtMK0QqXK5+E@suse.de>
In-Reply-To: <ZFJTDtMK0QqXK5+E@suse.de>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Wed, 3 May 2023 08:24:10 -0700
Message-ID: <CAAH4kHa_mWSVrOdp-XvV9kd0fULQ_OOf4j8TMWJy6GhoZD5SEg@mail.gmail.com>
Subject: Re: [ANNOUNCEMENT] COCONUT Secure VM Service Module for SEV-SNP
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Klaus Kiwi <kkiwi@redhat.com>, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, amd-sev-snp@lists.suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 3, 2023 at 5:27=E2=80=AFAM J=C3=B6rg R=C3=B6del <jroedel@suse.d=
e> wrote:
>
> Hi Tom,
>
> thanks for that comparision!
>
> On Tue, May 02, 2023 at 06:03:55PM -0500, Tom Lendacky wrote:
> > While both SVSM implementations use the Qemu Firmware Configuration
> > (fw_cfg) interface, the coconut-svsm relies on it a bit more than
> > linux-svsm. In either case, other interfaces may need to be supported i=
n
> > order for an SVSM to work with a VMM other than Qemu.
>
> Right, that is something I have been thinking about. After I talked to a
> few others about it, I came to the conclusion that neither COCONUT nor
> linux-svsm use an optimal interface to request information from the HV.
> I think it would be best if we move to a model where the MADT and E820
> tables from QEMU (or any other HV) are part of the measured initial
> memory image, to make that data trusted. But we can discuss that
> separately.
>
> > - Both SVSMs end up located in a memory slot outside of memory that is
> >   reported to the guest. Coconut-svsm gets the location and size from
> >   fwcfg, which is customizable via the Qemu command line. Linux-svsm ge=
ts
> >   the location and size from the build process and validates that locat=
ion
> >   and size.
>
> Correct, COCONUT also has a fall-back where it just uses the last 16MB
> of guest RAM if the fw_cfg file is not there. That needs OVMF support,
> though.
>
> >   - Pagetables:
> >     Page table support can be tricky with the x86_64 crate. But in gene=
ral
> >     I believe it could still be used. Coconut-svsm uses a dynamic offse=
t-
> >     based approach for pagetables based on the final physical address
> >     location. This offset could be utilized in the x86_64 crate
> >     implementation. When CPL3 support comes around, that would require
> >     further investigation.
>
> Yeah, COCONUT does not only use an offset mapping, it also has specific
> mappings for the per-cpu areas. Those are mapped at a fixed location,
> same with stacks, so the needs already go beyond an offset mapping.
>
> > - Coconut-svsm copies the original Secrets Page and the "frees" the mem=
ory
> >   for it. I couldn't tell if the memory is zeroed out or not, but
> >   something that should be looked at to ensure the VMPCK0 key is not
> >   leaked.
>
> Thanks, that is a real issue. I just wrote a fix for that.
>
> > Some questions for coconut-svsm:
> >   - Are there any concerns with using existing code/projects as submodu=
les
> >     within coconut-svsm (e.g. OpenSSL or a software TPM implementation)=
?
> >     One of our design goals for linux-svsm was desirability to easily
> >     allow downstream users or products to, e.g., use their own crypto
> >     (e.g. company preferred)
>
> No concerns from my side to run any code you want in a CPL-3 module.
> This includes code which uses external libraries such as openssl or
> libtpm. The modules will be in an archive file packaged with the SVSM
> binary, so that everything that runs is measured at launch time.
>
> >   - Are you open to having maintainers outside of SUSE? There is some
> >     linux-svsm community concern about project governance and project
> >     priorities and release schedules. This wouldn't have to be AMD even=
,
> >     but we'd volunteer to help here if desired, but we'd like to foster=
 a
> >     true community model for governance regardless. We'd love to hear
> >     thoughts on this from coconut-svsm folks.
>
> Yes, I am definitely willing to make the project more open and move to a
> maintainer-group model, no intention from my side to become a BDFL for
> the project. I just have no clear picture yet how the model should look
> like and how to get there. I will send a separate email to kick-start a
> discussion about that.
>
> >   - On the subject of priorities, the number one priority for the
> >     linux-svsm project has been to quickly achieve production quality v=
TPM
> >     support. The support for this is being actively worked on by
> >     linux-svsm contributors and we'd want to find fastest path towards
> >     getting that redirected into coconut-svsm (possibly starting with C=
PL0
> >     implementation until CPL3 support is available) and the project
> >     hardened for a release.  I imagine there will be some competing
> >     priorities from coconut-svsm project currently, so wanted to get th=
is
> >     out on the table from the beginning.
>
> That has been under discussion for some time, and honestly I think
> the approach taken is the main difference between linux-svsm and
> COCONUT. My position here is, and that comes with a big 'BUT', that I am
> not fundamentally opposed to having a temporary solution for the TPM
> until CPL-3 support is at a point where it can run a TPM module.
>
> And here come the 'BUT': Since the goal of having one project is to
> bundle community efforts, I think that the joint efforts are better
> targeted at getting CPL-3 support to a point where it can run modules.
> On that side some input and help is needed, especially to define the
> syscall interface so that it suits the needs of a TPM implementation.
>
> It is also not the case that CPL-3 support is out more than a year or
> so. The RamFS is almost ready, as is the archive file inclusion[1]. We
> will move to task management next, the goal is still to have basic
> support ready in 2H2023.
>
> [1] https://github.com/coconut-svsm/svsm/pull/27
>
> If there is still a strong desire to have COCONUT with a TPM (running at
> CPL-0) before CPL-3 support is usable, then I can live with including
> code for that as a temporary solution. But linking huge amounts of C
> code (like openssl or a tpm lib) into the SVSM rust binary kind of
> contradicts the goals which made us using Rust for project in the first
> place. That is why I only see this as a temporary solution.
>
> > Since we don't want to split resources or have competing projects, we a=
re
> > leaning towards moving our development resources over to the coconut-sv=
sm
> > project.
>

Not to throw a wrench in the works, but is it possible for us to have
an RTMR protocol as a stop-gap between a fully paravirtualized vTPM
and a fully internalized vTPM? The EFI protocol
CC_MEASUREMENT_PROTOCOL is already standardized, and it can serve as a
hardware-rooted integrity measure for a paravirtualized vTPM. This
solution would further allow a TDX measured boot solution to be more
thoroughly supported earlier, given that we'd need to have the RTMR
event log replay logic implemented.

> Great move, much appreciated, thanks a lot for that! Let's work together
> to make that happen.
>
> Regards,
>
> --
> J=C3=B6rg R=C3=B6del
> jroedel@suse.de
>
> SUSE Software Solutions Germany GmbH
> Frankenstra=C3=9Fe 146
> 90461 N=C3=BCrnberg
> Germany
>
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev, Andrew Myers, Andrew McDonald, Boud=
ien Moerman
>


--=20
-Dionna Glaze, PhD (she/her)
