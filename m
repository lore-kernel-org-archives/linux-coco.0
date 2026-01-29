Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3935136A004
	for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 22:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769724808; cv=pass; b=TupxCYtOHOR9/4o5ICZ+z7ttOROt/vxjTG8b3CvTW7NTRKqLhk9KNdQzEJe8ttXBiZt5WZubxb8afoIuaTRK3pjcb3Yz15A1dTbrVbDHan5jvKuvVyK4AO2tIGDQkBSnag82yEa8PMYJ3JXvYP7ixNIZ8XjKVynLz+77mtpZueA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769724808; c=relaxed/simple;
	bh=L2FEJZ4Nf+9mAkwGC5BxFQcOxPAAWfgp3tiBEDKAlhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G560FEzgrCTpP2PXugIMa87yQGk+lT06RgknqTgACloMUZERb4cYeEODDX0vdGXc4XU04UA92U/4Y+0c0Aaq0093ol7SN8BMfm3pFRxEPdcPpUIejYliw0p1S14wf4TLOTNmYwTmJ/vKZ01cX7n1/eOkBvrlX5Lwbzsj5N+0en8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bkhFsjLm; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bkhFsjLm"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so233783066b.2
        for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 14:13:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769724805; cv=none;
        d=google.com; s=arc-20240605;
        b=OKBwr2slrU4J018EAJGfB3g1KF2D36H/v2N3KEJpVq27QMacIj2noQGR69a9BIaJ87
         gyw4I8JQs/hW7+KG9J78cUbMy47xPWz0PT2tf0qAPDMlFLk4UDW4b24nuyJpx6sPknRi
         wJJx35aZwhV2poM9eGUemxyKZBUq5dEtl5x2fHTLux3Ni/VwEv0lXMYTIkqPLeXl2U6k
         rtzw58SMfyZLDDNOqN2o/9g71uis1mBt0wEZ/dto5YsIEZNT4NueBhBkqSNK8H3pzLVi
         Buxzo3hG48MZ0Lrxo7zggbC1ISmKkENX15zRCP4LmJ+oO+oSGXbyGRSIUOenfH1AgsvX
         mucw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=L2FEJZ4Nf+9mAkwGC5BxFQcOxPAAWfgp3tiBEDKAlhw=;
        fh=IcKo2Sb7+s70GVGVQfpWs5jMg58h0oHiOniT4Vu0qIg=;
        b=f9SNjhMDa7EjCKjIPXt5BMi+6SGzyZ7OceDfQ4aTdx3rREEUv7/ubDSS2ub7lTugF7
         49nRVDAg7wzI8mtKtCGrk9Si3MwDHeVaXEJRrqHrEF6pwf45oOJ+4kwFfQWoyxv3qjf+
         Lo5MzMvCHr6UlCgHZ7rim0x0nIDkdxpPaP2nB2evjx3iJaSFm4utDXlqJdD0L2Ah4A9l
         xKbMWEsPQIy0nLHmKT/X7mUYfo8xWkxukWwMrMSlEumaYc/xPieL83CKeyIZcCKDJYZP
         qxH5NDeyQxN/mQDMeB25chTrO/XHrVRiexTTKugSpl+yzuLkqSKj8ad7qFvt5SnoLxQj
         gRgw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1769724805; x=1770329605; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L2FEJZ4Nf+9mAkwGC5BxFQcOxPAAWfgp3tiBEDKAlhw=;
        b=bkhFsjLmpA0Ig2NBNQNZ4hrdspAQuKeWq77itfAXdP/SE+G56vw4iQW8KozBQC92xJ
         x9R7C5dBbRxmBkQHfZFxyGImHvPhjewyzxtMcX8Xfywd2lcNZ8Z62KKTVK0FSJ2J/7e+
         hUnseCY5zc7uWS5SVzEFdrUfMkyPfDczGU8j0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769724805; x=1770329605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L2FEJZ4Nf+9mAkwGC5BxFQcOxPAAWfgp3tiBEDKAlhw=;
        b=GmEYZ+72vrrnEiivuTqnHY4Rm+Ia29MFGGJRar+ESDHRGszPoZslsddn8M7gcWV856
         8hK/1Ay6GrKRj5rcSKpULmTwR/khEHzmMmllHjAAyRMZxeUI5pxwEzkNKift1eNVOUJa
         B3nY2Y4qHBofRUTQ0uhgONUEEKumbP8RSXmXo8wlVsQ+Lgxtk5MN/WMUn3nZwWlzft+u
         kgX7vR7Q9bjtWi6ALOL8CP9NANaOUPUQKR3Va7i8TA3y/M/vy9Jf6skf/6K+3z4Fbl2j
         g25rZ3xEEQs3tRhWBYjRDAiDzNo4pBcWWH5OQfgHW9FMpAKSi4cYs1x7197b/p0fZIVY
         eGag==
X-Forwarded-Encrypted: i=1; AJvYcCV1meArUPJafygNRN4uxhKXPM+lwAei3mnajf8HOsSbM+OuL5M2cosiLNF6yUwVUNo5KuElCIc/Os+H@lists.linux.dev
X-Gm-Message-State: AOJu0YwTuZtX3q+g2/6FMBHfVfeaLwVDWASRVX+00wWIoG7SQmGeZS5T
	f66iDbWb8skyHTSQwaJWDED8xrltjgCqMJRiYjHaFjbq9HXepujUi9qutiRcBC/AJftSfoF5xYi
	7H3G9/Xa+UyMorXOIawbM6JMEd0WEMp7XJqFoTIQ5FxpIG74VyuoYy3uH
X-Gm-Gg: AZuq6aLDJlISWjqIPJO85km9lmDLqHX0HnbGrFWV4C3SZF0HItO4K6s0JV/RRwADlQy
	uySTLcUaDlgSyqaMlmLn0cwaiGLEVHGl6Z9Y0/aOlCxJreNWRtaKuhIv8o7k5npkjSRLtM0dx27
	79pNvj1e+XQOTEE2tHxp4QEVhwQK3zvip8C8+SCeWQCildvBbtyWQveNIjHHZIn70/bL+LGLBf6
	kz5J91ZZFDzqScscimm4QF8BrJyteCEBprQ7dX0zhBZlRm/wMkW2kdy6ly+owC80Vev0xDCQg==
X-Received: by 2002:a17:907:1b0d:b0:b83:f75d:ba2b with SMTP id
 a640c23a62f3a-b8dff6677cfmr41078666b.32.1769724805537; Thu, 29 Jan 2026
 14:13:25 -0800 (PST)
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
 <E15F74BD-E33C-4184-B694-C152696C4895@zytor.com> <CAFLszTgHvFvB=Be=MwctUfR4ngA=rxxHHP1A1M-XvXbT8yN9JA@mail.gmail.com>
 <36C4A641-A124-4082-884D-90AE22B10275@zytor.com>
In-Reply-To: <36C4A641-A124-4082-884D-90AE22B10275@zytor.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 30 Jan 2026 11:13:13 +1300
X-Gm-Features: AZwV_Qj10kuIy0PI2TxYxcPaUzuxQtP6nBTwH0eNgxOh6kpcbPPh7w2AFb-EiCg
Message-ID: <CAFLszTiQ_BAMGJPJfAV4TXiELvZn12+wX2txBuzMcQ_nw2kzOg@mail.gmail.com>
Subject: Re: [PATCH v1 08/14] x86: make CONFIG_EFI_STUB unconditional
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: ubizjak@gmail.com, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, 
	bp@alien8.de, dave.hansen@linux.intel.com, kas@kernel.org, kees@kernel.org, 
	linux-coco@lists.linux.dev, mingo@redhat.com, nathan@kernel.org, 
	peterz@infradead.org, pmladek@suse.com, rick.p.edgecombe@intel.com, 
	tglx@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

On Tue, 27 Jan 2026 at 16:22, H. Peter Anvin <hpa@zytor.com> wrote:
>
> On January 26, 2026 7:14:27 PM PST, Simon Glass <sjg@chromium.org> wrote:
> >Hi Peter,
> >
> >On Tue, 27 Jan 2026 at 15:55, H. Peter Anvin <hpa@zytor.com> wrote:
> >>
> >> On January 26, 2026 5:44:43 PM PST, Simon Glass <sjg@chromium.org> wrote:
> >> >Hi Peter,
> >> >
> >> >On Tue, 27 Jan 2026 at 11:21, H. Peter Anvin <hpa@zytor.com> wrote:
> >> >>
> >> >> On 2026-01-26 13:19, Simon Glass wrote:
> >> >> >>
> >> >> >> Including the EFI stub doesn't mean using EFI to boot is required.
> >> >> >
> >> >> > Yes, understood, but it adds bloat. More importantly it will lead to
> >> >> > people assuming that the stub is always used and thus unwittingly blur
> >> >> > the boundary between the stub and the kernel itself.
> >> >> >
> >> >> > What is the actual need for this?
> >> >> >
> >> >>
> >> >> I would argue that the opposite is more likely: someone inadvertently builds a
> >> >> kernel without the stub, the bootloader goes down a legacy support path and
> >> >> things seems to work... except for some platform subtleties.
> >> >>
> >> >> The bloat is there, but it is small and is only in the on-disk kernel image;
> >> >> it is zero at runtime.
> >> >>
> >> >> As such, I don't think this option is a particularly good idea anymore. If
> >> >> necessary, it could be hidden behind an EXPERT option, but I first wanted to
> >> >> see who if anyone actually cares in a meaningful way to maintain this option.
> >> >> Every option, after all, adds maintenance burden.
> >> >>
> >> >> Note that the BIOS stub is unconditionally compiled and included, and that has
> >> >> not been an issue.
> >> >
> >> >What is the maintenance burden here? I could potentially take that on,
> >> >but I would first want to understand what is involved.
> >> >
> >> >The use of the word 'legacy' worries me too. Is this patch a step
> >> >towards removing the non-EFI path?
> >> >
> >> >Regards,
> >> >Simon
> >
> >(joining the threads)
> >
> >> Bypassing the firmware stub (BIOS or EFI) is really only appropriate for special user cases, like kexec, because it removes the ability for the kernel to deal with system issues at an early point.
> >
> >Does this dealing happen in the EFI stub, or later? Are you referring
> >to ACPI fix-ups or something else?
> >
> >>
> >> However, kexec needs it, and it's not going to go away. However, that doesn't mean we should encourage this in cases which doesn't need it (no matter what the Grub maintainers tell you.)
> >>
> >> Now, if you are using KVM without EFI you are probably doing BIOS boot (regardless of if you know it or not), entering via the BIOS firmware stub.
> >
> >I am thinking of the 64-bit entry point to the kernel. everything
> >being laid out in memory ready to go.
> >
> >>
> >> I just realized you are the U-boot maintainer, so I'm assuming you are thinking of the case where there is no UEFI or BIOS firmware. In that case, just like as for kexec, the current entry point will continue to work, of course.
> >>
> >> What we don't want is having to suffer being on a BIOS or EFI system but not being able to leverage it for the benefit of the kernel. The kernel image is much easier to upgrade.
> >
> >More generally I am thinking about a simple and clean API for the
> >kernel that doesn't involve having to provide 30K lines of firmware
> >code just to boot. The BIOS entry point (if that is what it is called)
> >is quite close to this ideal, even though I know it has shortcomings.
> >
> >Regards,
> >Simon
>
> Yes, I understand.
>
> The 32/64-bit entrypoints aren't going away; it would be impossible to do so.
>

OK, so 'depend on EXPORT' seems good to me.

> The general rule is: do things as late in the boot process as possible, but no later.
>

Just on this point, I wonder how we should define 'late', in the
context of EFI. For example, if the kernel stub reads a file, meaning
it calls back into Tianocore, it is using both early and late code.

Regards,
Simon
