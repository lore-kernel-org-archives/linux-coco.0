Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFCD2FD1B6
	for <linux-coco@lists.linux.dev>; Tue, 27 Jan 2026 03:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769483670; cv=pass; b=dq05DwewpcmD0hd+ul36gbtK0QvHeQjG3XfZQj8yNAH1Wvq/q0o2b9J5jgSYz9+Nr6V792aqFObyKRHMKZn3vFQ/xepV4chsqx4C25llNPpSzIZF9ovITtI+vfMImdnVf2AN4XehhD8Ax2Yl1yf95/AZEof/5+nrJIalRDNXoRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769483670; c=relaxed/simple;
	bh=5Qs6M5NvcPqlOzeXlnXrwOYMeG0q96NBIS2hUfXhKMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=trT8yXbfmlCgIke/JhBpF0/XdjBuB7BrFSKTwOICjTpwUT04p+g0JpAvrMBiniIX/dnCq2pDMeZF/KfHW5SXJoIvbXKTMtAUChstVTBTIAoEIudQXfs34L6rP352l6aGD62FQTInSLSjFDQLUYYGFlOobEV1bk40q282jQ0C4D4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mqkhjLQu; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mqkhjLQu"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b8849dc12f6so796410166b.1
        for <linux-coco@lists.linux.dev>; Mon, 26 Jan 2026 19:14:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769483667; cv=none;
        d=google.com; s=arc-20240605;
        b=SSB33E0EVFfj3Mgabqn03zMIX8gqCc0s6ayFzZ21uCYtjNIGEctFxap1T2RhAfKdLn
         OCq5tm+pK99DI74owR5i3eEYyfR7/AM9NYDgf1vuVQ53lM4fI7prDATIN/nIAdBconzA
         lD78SciAQTUsPjgjS5KIT/kkJ4SBMAxWO85D8e9Vh3M+5pYMGpwITJFEK0TMnqjETXF6
         BFV6d/8O8jXhflcxb58xIggbN04g5q2krHBqIwhO1Jmi8b2aW4aSi/OAELFUMjC4canF
         BWy9/cCJX3N8irEOToc/vI2IcMo5+RML6YbcG7L2zCoewhrpnH4S+M9NUDxdczKiovV9
         buRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5Qs6M5NvcPqlOzeXlnXrwOYMeG0q96NBIS2hUfXhKMQ=;
        fh=qWAX8PLC07Yec8XKhafZE0syhm/BNfXKViWFOPrpcx8=;
        b=MdE2KxelxsQ0RV7AnlT9k9OtIvo0fVCe0Oxc6WRnf3ldnhKhHsGRIQC8sR93Sbf8NB
         5Zo4zTfApHJGucWikaktFvjU3S7aeKjv8mGrF7gObRemNazKAqIW4Acd9QCuP3T40Fre
         JYp6+IuCl+jyWA3hdIuOG5GUK/m0Hjs160rZ+5UwS8sSanJQFdc01RRW6/TfxqC/7KkR
         bGFsq80WkFs8Albo1tVBZEu2Rd8+LZfth8fMW3N+wxKEjvg8cSogiE8LCgsPPKbxgKot
         ZSVoDtuYsenwtjD5IxouD2At/gbzPdO1Q0ECsIMenzRxHBGp/bisgHWYbD/qwz4SPX/D
         di6A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1769483667; x=1770088467; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5Qs6M5NvcPqlOzeXlnXrwOYMeG0q96NBIS2hUfXhKMQ=;
        b=mqkhjLQu1vQtTVhknl1r8xnm9fRieWxSyV6PgcAE5MZSOl+TjiO9TkCooUjUYesbPy
         r8HrT3nnhNE8KkXwbDRvdmU1bbcZFIfv+UpHfjBu185GogblLQSWXHWEJ5wI+DXAUVFK
         gtoE+z9Aia+lomo3/7ZCj1c6u5fVvgKBkMkI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769483667; x=1770088467;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Qs6M5NvcPqlOzeXlnXrwOYMeG0q96NBIS2hUfXhKMQ=;
        b=lMSRIbw9QfRgDoHjD+53BvyEgPkmmbNBbxxuYDoqKPQR1QZWblHQENH7T6voJWBNqe
         uPbLPCEpaOQhht310zwMLupHKJFuarfiCyN2weZqnPaJCcltK71UJIU8P9XtyxpEQ6rg
         mSc7Xwzp4dZKuCvHxftZLvTnsEKKG/euMEcRUyf6+Dd4osL8/9BCWMTTjxN3Rc5f0k39
         GaEpimx0GWIPW9SDgMZUM2y0GXoRJadDLiytdFetpDLO1OsuZuTFoLM2FbH/PqgMJP4q
         wLiOGXhcikeiljpqXEHi8vZZ+hJtF8Unn02+LxhRbt1RO7kosHfApsMeDZsYhnReizE2
         4AQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVB2dQa8zbSqWrFmTN5Jt4+dhB4nxoq+Z14znZ6gHXGRKEKqrHd1yf0M5nqAeGl+rl8K+IOcGA2hMeQ@lists.linux.dev
X-Gm-Message-State: AOJu0YzlPS09nwoHY52Vfi3v32k9VyAefiFGZ2taP1Oce3dKsk+s5T16
	d94D3t4u5SmWiV2UX5kPMwRMcXqEEEMOQnn2fmnYaFYgmZRUgoW2UdCP9LrnotT6m8Lu/PN/XKL
	wo633RyI7YbH3LffKDid6bsybrhU2nCIEHQGUwgC5
X-Gm-Gg: AZuq6aIzqMMimCWjT7Chj2McKSC50j7X7VkjEB4rCbXi0UeCtuQ47krrrZSoYmfhvVv
	v+DaKo1xuMmTwdaUPn9b2JV50T2Ud7707YjqWuoqYdQeOLuy6vANKNjUBJQFCjQwhrlu2G96nw8
	cJEfaDV8AeTA30enGUb6AbvvujYsbPJDDwdOLq4z1K5x1CrCewcg3Ys46WsHrTF95AqZsy2cniS
	mT6UBmiKeqRlv1mz0ZhXgIq8kcJMMNVSwmEhUFwwyw7+X4J7qfbillSSvFYqYNWtWPOCJD9nANt
	O+ISnJI=
X-Received: by 2002:a17:907:3f22:b0:b87:7e8:e287 with SMTP id
 a640c23a62f3a-b8dab2fd97fmr26311266b.30.1769483667578; Mon, 26 Jan 2026
 19:14:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFULd4bV6jKqHb-vC47skjNvbctit3VccXpF02oYt0icaq1r-Q@mail.gmail.com>
 <20260122185740.50298-1-sjg@chromium.org> <90DAAB54-CBF0-47BD-981A-FEDD26CDA0FD@zytor.com>
 <CAFLszTi+N7Yj0yYHKroypmBoFSx+9m5er8pgULsKbPuooFYj-A@mail.gmail.com>
 <643bfc24-8cc1-4f70-85e2-f6829c8e03db@zytor.com> <CAFLszTjhJkfBrG-QiF6cEz-K1ODHPziJDsTthBUsqoZ=hDxsjA@mail.gmail.com>
 <E15F74BD-E33C-4184-B694-C152696C4895@zytor.com>
In-Reply-To: <E15F74BD-E33C-4184-B694-C152696C4895@zytor.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 27 Jan 2026 16:14:27 +1300
X-Gm-Features: AZwV_QhvgmcyYOtnw8ch0weUXW2CGP_LfwxP2tyaOVJfMc5SDjF7RF3mW-Bqx0c
Message-ID: <CAFLszTgHvFvB=Be=MwctUfR4ngA=rxxHHP1A1M-XvXbT8yN9JA@mail.gmail.com>
Subject: Re: [PATCH v1 08/14] x86: make CONFIG_EFI_STUB unconditional
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: ubizjak@gmail.com, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, 
	bp@alien8.de, dave.hansen@linux.intel.com, kas@kernel.org, kees@kernel.org, 
	linux-coco@lists.linux.dev, mingo@redhat.com, nathan@kernel.org, 
	peterz@infradead.org, pmladek@suse.com, rick.p.edgecombe@intel.com, 
	tglx@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

On Tue, 27 Jan 2026 at 15:55, H. Peter Anvin <hpa@zytor.com> wrote:
>
> On January 26, 2026 5:44:43 PM PST, Simon Glass <sjg@chromium.org> wrote:
> >Hi Peter,
> >
> >On Tue, 27 Jan 2026 at 11:21, H. Peter Anvin <hpa@zytor.com> wrote:
> >>
> >> On 2026-01-26 13:19, Simon Glass wrote:
> >> >>
> >> >> Including the EFI stub doesn't mean using EFI to boot is required.
> >> >
> >> > Yes, understood, but it adds bloat. More importantly it will lead to
> >> > people assuming that the stub is always used and thus unwittingly blur
> >> > the boundary between the stub and the kernel itself.
> >> >
> >> > What is the actual need for this?
> >> >
> >>
> >> I would argue that the opposite is more likely: someone inadvertently builds a
> >> kernel without the stub, the bootloader goes down a legacy support path and
> >> things seems to work... except for some platform subtleties.
> >>
> >> The bloat is there, but it is small and is only in the on-disk kernel image;
> >> it is zero at runtime.
> >>
> >> As such, I don't think this option is a particularly good idea anymore. If
> >> necessary, it could be hidden behind an EXPERT option, but I first wanted to
> >> see who if anyone actually cares in a meaningful way to maintain this option.
> >> Every option, after all, adds maintenance burden.
> >>
> >> Note that the BIOS stub is unconditionally compiled and included, and that has
> >> not been an issue.
> >
> >What is the maintenance burden here? I could potentially take that on,
> >but I would first want to understand what is involved.
> >
> >The use of the word 'legacy' worries me too. Is this patch a step
> >towards removing the non-EFI path?
> >
> >Regards,
> >Simon

(joining the threads)

> Bypassing the firmware stub (BIOS or EFI) is really only appropriate for special user cases, like kexec, because it removes the ability for the kernel to deal with system issues at an early point.

Does this dealing happen in the EFI stub, or later? Are you referring
to ACPI fix-ups or something else?

>
> However, kexec needs it, and it's not going to go away. However, that doesn't mean we should encourage this in cases which doesn't need it (no matter what the Grub maintainers tell you.)
>
> Now, if you are using KVM without EFI you are probably doing BIOS boot (regardless of if you know it or not), entering via the BIOS firmware stub.

I am thinking of the 64-bit entry point to the kernel. everything
being laid out in memory ready to go.

>
> I just realized you are the U-boot maintainer, so I'm assuming you are thinking of the case where there is no UEFI or BIOS firmware. In that case, just like as for kexec, the current entry point will continue to work, of course.
>
> What we don't want is having to suffer being on a BIOS or EFI system but not being able to leverage it for the benefit of the kernel. The kernel image is much easier to upgrade.

More generally I am thinking about a simple and clean API for the
kernel that doesn't involve having to provide 30K lines of firmware
code just to boot. The BIOS entry point (if that is what it is called)
is quite close to this ideal, even though I know it has shortcomings.

Regards,
Simon
