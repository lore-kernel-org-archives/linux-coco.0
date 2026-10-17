Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E333E4C73
	for <linux-coco@lists.linux.dev>; Sat, 17 Oct 2026 18:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792260981; cv=pass; b=c9L4l+1RzRJMDUzbwvFesdPxg+U16TO8YD8UNxW5NQ4r8xbbkTcdUPcihjuJH5mDWuoE0AC9p/z2pPEksKO7evTB2m5fd4Wb7cf6baRKsx+l5Cvg/+wLq2C2Kg8UUNEQGf5aboTC9HHTlDHofKC+zWKdG8XuE9J/K7Mu0xWe5Ik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792260981; c=relaxed/simple;
	bh=gcTSzRaGTbutrkt9X+KlfCvLxA9mYQLFAjncxzTeeQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IVQfz+nH62A+yqbdMple09JFbYb+YsTBBdKZ2DiKDMFNXBaBZi851uVvxIlWX+Bm/2sM7GOM2IZYJoYDGF5GJCZb+08mll5xoM9ia7Na24k1xDdjlfhhjgvP7PgaS+EfEs/rqLNv3fGPUZq5lMvooKPf6BcIFiWFaAEVQNcXAB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qs9eN2oh; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qs9eN2oh"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e946155442so6774365ad.3
        for <linux-coco@lists.linux.dev>; Sat, 17 Oct 2026 11:16:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792260978; cv=none;
        d=google.com; s=arc-20260327;
        b=R7DurwgphVQy7/4s9yhaOl52F4hPUjvgzBe05uNmfuYZmmt6u9CHw+n2PajL7ripUb
         CLWrsBoiZQDH1ioHzRUEq/QFinhI3CjW44rspBZpBjUuXy9puEka7GNCEdAaBOhVuvct
         U+mnkTo0I/I2RdtVh2bK3figZQGpEI0sej3Wyv73tmYzlGAijB0QnIe23wCEayW3BYfr
         zzDpS0cZ7vEqX15keR3ENd7DW9mM9dJcnmtNKmQ9SNfwU8SuLTDjCFa6rkod2gQHy0JU
         l94oxWo/fN73eV3Fpy4Hpc7ENcigu4+M+GTys5b05I3mCz5A70ha3qEULGM5afQjO5B6
         88KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gcTSzRaGTbutrkt9X+KlfCvLxA9mYQLFAjncxzTeeQ8=;
        fh=6SKsw5YOJDMvlrjCXfeUK67k7h0fFMoGojYZLX3zj28=;
        b=Dx3VwjCipwLNM/mN1TX2DmK6ojmMoeiz89H3rLGjMOFNNsKFWMw4/CGw7TX514rr9Z
         aIjAzxgn9PMFfjd4UUuoVef1niGNH9FHE58RcsYDd0X27qON0F73vrKOSmNLlmrkvmBV
         1bzwQD2lhLi8OHprpGc642eTP2c3Wr+4qu4VeSllsNuV6NaOUq+P8TFL0bvUpD3b2BGz
         hjsvk0Z2B9aG1tDbwGqU/e8JibNrM1CdabJjfByJHLH21mQ971gkjDBkDlohy8KaLccb
         ra6Xnid+9uUGiyJJA39z9gdpNNyFMgA+O+oeGJVw/Njjm6EJkuyyBHJatUGHZlqn1kWO
         9gTg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792260978; x=1792865778; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gcTSzRaGTbutrkt9X+KlfCvLxA9mYQLFAjncxzTeeQ8=;
        b=Qs9eN2ohE16uxUq5vJHMb6NhMSZkEtVF+lZg7Q/eDgKWqjrk9jUXtL+0XtETpTJs2d
         y9or/Ytcul4z5NQnznR95LDfIBXmx5VfZEc3rRyy3pDVuMro03tq4UTn5ApLG+knRzho
         BilcBb2lJkUxVfShDFcwioW/RDpMGm6r0PklTjCujhZOWqkgs2Ijczm9e/L1eLEjaSZt
         +TBwjXBMRhvIpOSWgVMYzotTFC1yh3EDDk6Qzn8UnvuQtJlUV7Kmq4iAx0eCZ0tyzsxj
         UTbgLSsXBgR1HBf8Zbz0qOguCkEXZCPsRVyxx5YKPD0q4FSHb8D6NXy3iPYg/nahoLMp
         GEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792260978; x=1792865778;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gcTSzRaGTbutrkt9X+KlfCvLxA9mYQLFAjncxzTeeQ8=;
        b=XrvxMeFj9emeT5+hQx7/pzlIK/Al6gBaX52/wULT7/y1+c+Ddb/Hul/2aUxb61OE5b
         6ko/yLnwRHixHBCxKFFqeLicBmBneAjhBxyrtXDGtGfU62jpeC7UfpijaOnw9WviXDxm
         jT89aaDfKiKnJKwbN71RHWIvro2+or9/l7t4bNDwUH1JI/A9UbDv6vK/GmBVnMrHGur6
         aFGoC6f4AZHqCjyOlP/qljVn/KyKZT79y+0VcbDu9CKYvJ+xktykV4j4ldkahX0WgiWb
         dPYqXfG4uIa8mz5VbgRBGFIVnqupygYe76PR3FcmLerArDLmuzJlTY3BI2DPVGSwYVbf
         nGSA==
X-Forwarded-Encrypted: i=1; AKwUvByEhmAySw8pPI8Yblvl7/dBLgT+6rGF/lARsA2R76IbL/nax9WH9cYuDeB5+/jkbd4Tl9yEJMQ2crET@lists.linux.dev
X-Gm-Message-State: AFq9FYLe8nji9C2T0SDJBGDazPNtJqk0VR8Fif7JqnW1koLVkIej5nYJ
	DRYLhZVNVEMciZSU5NafKljsslS5atJQDFMWdb37ZhQejcpnL8RKrWTt3SDVNhV7NUKKGIvqcSh
	A1XBLD8wqLyZS7NDdfpm16RN6GwwZTck=
X-Gm-Gg: AYBFou2o1w2B+U47clL8toJqRzUs88+xLfPozG0aZudpLoS4ANDnrp1gGxPK9k6INin
	I+1hfAMuCgPgp6fOHVN2m+BvcUlh421FIQGcbEjoqJ7gSWMgPqn0hnF/u4uCJWwll7/ljwpup+U
	cA+mtfpDJJyhuZBx10gWq6U2f+eIHNle+++nZuDX0zwl6IXh7PISObYv4WazpMafQHBq8hdcRbM
	MaNFZm4/jMt8CIHER1vkFHVWPUngrvQGoQPwvpl1PopAHETKOojKEwejI5RmFlr39c7OHr2uSAF
	ompGnLDnPkc7SNKMX+qJkPtZTOejYYQk104U/Kmj0jk0utECh55lO2RF0W10PvQKN69jZ7wrwyN
	s4HR+LTWqv3i0R4VZSg==
X-Received: by 2002:a17:903:f84:b0:2e8:1f8a:9113 with SMTP id
 d9443c01a7336-2e9a6f58265mr30097085ad.40.1792260978190; Sat, 17 Oct 2026
 11:16:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261015145053.3664509-1-jiri@resnulli.us> <20261016234354.GA664420@nvidia.com>
In-Reply-To: <20261016234354.GA664420@nvidia.com>
From: Dionna Glaze <drdeeglaze@gmail.com>
Date: Sat, 17 Oct 2026 11:16:07 -0700
X-Gm-Features: AclHuK_VfiECrlJzL8WxJydqMRSqCDHROeCkJ1kn-iT7JVYpxgerlwtvN-75yu0
Message-ID: <CANwfdvXFLJpC4Bc1PwRoUUP20fu2K8b+FHZ1JLLFXAikC-cBaw@mail.gmail.com>
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX support
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Jiri Pirko <jiri@resnulli.us>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, x86@kernel.org, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, david.quigley@intel.com, 
	lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com, 
	cedric.xing@intel.com, sameo@meta.com, James.Bottomley@hansenpartnership.com, 
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com, 
	jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com, 
	jarkko@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 4:43=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Thu, Oct 15, 2026 at 04:50:33PM +0200, Jiri Pirko wrote:
> > From: Jiri Pirko <jiri@nvidia.com>
> >
> > Linux has several attestation interfaces tied to individual technologie=
s.
> > That makes evidence retrieval, measurement registers, device state and
> > kernel consumers provider-specific.
> >
> > This series introduces a common attestation subsystem. Its goal is to
> > support platform, TEE and device providers through one model, including
> > TPM2, TDX, SEV-SNP, Arm CCA, FIRME, Caliptra and PCI/TSM-backed devices=
.
> > This first series implements the common subsystem and a TDX provider.
> > Existing native TDX tsm_mr and tsm_report interfaces remain independent=
.
>
> To add some more colour on where this came from for others..
>

Forgive me for my following "I still don't get it" responses below.

> About 3 months ago we started looking simultaneously how to support
> roots of trust (ROT) HW in place of TPM and how to respond to the
> feedback on the netlink proposal for the TSM SPDM.

Given that I was tagged on this thread and not that one, I'd
appreciate a pointer to which you mean.
Is it https://lwn.net/Articles/1079098/?

>
> We began talking about generalizing tsm_mr to handle more than just
> "tsm" into a broader set of roots of trust, including TPM. In this way
> it could act as a multiplexor for any measurement user in the kernel,
> like IMA for example. I see others have independently come to a
> similar conclusion that IMA needs ROT agility, but I also know that
> DRTM needs the same ROT agility too.
>

+Jarkko
The TPM driver is pretty entrenched and heavily used by different user
space applications, so it seems really ambitious to bundle in TPM
here.
Consider that you have to do a lot of command interpretation to know
whether a user is getting or extending a PCR value, or whether it's
systemd doing an NVPCR thingamajig.
I don't think you can intercept commands and translate to intent for
any kind of extension to be correctly tracked by your MR journalling
addition here.
Can you explain a little more what your intent is?

> Bringing in the SPDM side, the netlink TLV uAPI fits nicely and can
> expose all the structured binary data it has. SPDM is also effectively
> a ROT without any measurement registers.
>

I would push back on SPDM being a ROT because you're talking about
different devices.
If we're Linux running on the CPU, the ROT is TPM or one of the Coco
things (SVSM vTPM, TDX attestation on MTMRs, ARM CCA attestation on
REMs).
If we're Linux running on a DPU, the expectation is Caliptra
bootstrapped the device and a DICE boot chain got to a Linux
environment without runtime extensions.
There is nothing to communicate with over SPDM to learn your own
measurements since the boot chain is available to the kernel.
If this is changing, please fill me in.

There is nothing that you communicate with over SPDM that acts as your
_own_ root of trust, with one exception I can think of that I would
call a platform security bug: a platform root of trust.
If a PRoT holds back firmware from interconnects until it has verified
the signature, and then the devices receiving the firmware do not also
have their own secure boot, then there's a physical interposition
attack surface.
It won't be the CPU that communicates with the PRoT, it'll be the BMC
(as far as I know from any architecture I've seen).
The BMC can be running Linux, and be treating the PRoT as its ROT in
older architectures that don't have Caliptra on the BMC itself.
The CPU can talk to the BMC over a privileged veth device and use
RedFish to get SPDM measurements, so there's no new device needed in
the kernel for that communication.

Are we talking about this BMC without an embedded root of trust (eROT)
case to treat SPDM as a ROT?
Any other SPDM communication would be for composite attestation by a
lead attester that all gets bound under the ROT that the lead attester
uses (presumably TPM).

> Combining the two needs together it seemed apparent that TSM is a bad
> name for this expanded purpose so we start calling this attestation
> subsystem. "root of trust" subsystem would be another way to look at
> it.
>

I don't see how a trusted security module is a bad name for this.

> The general notion is any root of trust can come with a single driver
> and expose a bunch of different uAPIs. The modern most capable one
> would be the CTLV based ioctl interface through a char dev, but in
> cases like TDX the legacy uAPIs will also remain supported.
>

What capabilities are you trying to enable, though? I'm not really
getting the picture.
If I was right about you referencing Alistair's patch series, then
perhaps this is a clue?

>>This series is different to Lukas' original approach and the approach tak=
en
>>in the previous RFCs and instead adds the PCI-CMA support as a TSM driver=
.
>>This was described by Dan in [3] and [5]. The advantage here is that for =
PCIe
>>we can leverage the TSM work for a lot of the features and provide usersp=
ace
>>a consistient interface between PCI TSM and CMA.
>>
>> [..snip..]
>>
>>Other transport mode (such as ATA, SCSI, NVMe and MCTP) will
>>therefore need slightly different approaches, as TSM doesn't apply.

I don't really know why TSM doesn't apply, and how this proposal does.

> In this way I view it as a further evolution of the tsm report and tsm
> mr components in a way that lets us harmonize the uAPI and avoid
> hardcoding things in userspace. Though the name has changed so this
> linage is not quite as apparent.
>

I don't know why using a standard protocol in user space would be "hardcodi=
ng",
if we're leaving the SPDM message construction and interpretation to user s=
pace.
The TPM commands are standardized and left to user space to manage for exam=
ple.

> For example the end goal is for systemd report to be able to
> dynamically enumerate all the ROTs in the system, include them in the
> report, and generate signatures. Without necessarily requiring ROT
> specific code.
>

What other than TPM quotes and signed SPDM message transcripts are you
trying to cover?

> This applies to SPDM as well, ultimately every SPDM user in the kernel
> should be able to get an attestation subystem cdev and flow through
> the same uAPI channels that PCIe TSM uses, also into systemd for
> measuring and logging.
>
> I'm looking at something like 7-10 ROT drivers just for the current
> set of NVIDIA ARM servers. Probably another ~5 for NVDIA non-ARM
> servers. Then a couple more down the road. It is alot of variety and
> today all this HW is largely unavailable through Linux.
>

If there are NDA'd docs to get more info on these, I'd like to work on
getting my eyes on them.
Are there some doc numbers I can ask my hardware engineering rep to
pull? They manage vendor engagement.
