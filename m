Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B5630AACA
	for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 22:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769725398; cv=none; b=rlIHCfWcop2n6XcEl+WNMlSl6uTZediIF0lRQ9igOjmryLxOGIQnE9MmQ9tJfhBjCzd8JfiigpgH15e0i50xmFLnhAW3xsSOJ+FMVzN3tvvBVlUQRCUDYLpeo3cN9YdCMlT6yOsCuTFjihblAxwz5sBxutCzXLV42WjG96F1WYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769725398; c=relaxed/simple;
	bh=yeWhxgwOI39wZMUnPaFTkodP2OG2gFfuznHamNcp55U=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Y3jMjEjCUSZVcEUUtJxx8aADtNtdQ75x/xctRfosSTZpLbJP/M5e4GuVM6LsUjCMnIG7dc6VaKzcXdgfIFcFEnTnuhzNfQHdxnq1EwA+T9cJ1B3buyEcrbz5AVd0O3U8QjUOJTctC8gXoX4GlkBKVvbrdu9gBKAekugBQpoj5QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=jvBMLFj6; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="jvBMLFj6"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 60TMMhTI880091
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 29 Jan 2026 14:22:43 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 60TMMhTI880091
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026012301; t=1769725364;
	bh=yeWhxgwOI39wZMUnPaFTkodP2OG2gFfuznHamNcp55U=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=jvBMLFj67SnZc62nuR3Vq84bnR2Fw1vBLP9t7JRjdfwMHcxEgRuRasvk58bFEIXDz
	 4FP3OsrIbs3oadSvNRCe50i5MarW6Q7LLsgX8/tcOTLrFqwZCENKYfqCXPV9h3L39o
	 3A9vGPicUXZlL+rxjHXs5j4wp+ev2x3pA1ckjnLW4EYgW72XoDj08xQH6Sjm/HXTQg
	 377EK9oIsImtaQ2WQuWrAZS7m429MhY2Zz+5Foc3Vouyz3raOjxvoj20WX3X4LZzAS
	 mFnRUmNFB1Q4uR8VkBfl5l+Nqwv6lj/zoUyTJvQ3DgXaW696BOV1SEaW7h6QB7/pbB
	 0u8l/CzU3wp0w==
Date: Thu, 29 Jan 2026 14:22:37 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Simon Glass <sjg@chromium.org>
CC: ubizjak@gmail.com, linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
        bp@alien8.de, dave.hansen@linux.intel.com, kas@kernel.org,
        kees@kernel.org, linux-coco@lists.linux.dev, mingo@redhat.com,
        nathan@kernel.org, peterz@infradead.org, pmladek@suse.com,
        rick.p.edgecombe@intel.com, tglx@kernel.org, x86@kernel.org
Subject: Re: [PATCH v1 08/14] x86: make CONFIG_EFI_STUB unconditional
User-Agent: K-9 Mail for Android
In-Reply-To: <CAFLszTiQ_BAMGJPJfAV4TXiELvZn12+wX2txBuzMcQ_nw2kzOg@mail.gmail.com>
References: <CAFULd4bV6jKqHb-vC47skjNvbctit3VccXpF02oYt0icaq1r-Q@mail.gmail.com> <20260122185740.50298-1-sjg@chromium.org> <90DAAB54-CBF0-47BD-981A-FEDD26CDA0FD@zytor.com> <CAFLszTi+N7Yj0yYHKroypmBoFSx+9m5er8pgULsKbPuooFYj-A@mail.gmail.com> <643bfc24-8cc1-4f70-85e2-f6829c8e03db@zytor.com> <CAFLszTjhJkfBrG-QiF6cEz-K1ODHPziJDsTthBUsqoZ=hDxsjA@mail.gmail.com> <E15F74BD-E33C-4184-B694-C152696C4895@zytor.com> <CAFLszTgHvFvB=Be=MwctUfR4ngA=rxxHHP1A1M-XvXbT8yN9JA@mail.gmail.com> <36C4A641-A124-4082-884D-90AE22B10275@zytor.com> <CAFLszTiQ_BAMGJPJfAV4TXiELvZn12+wX2txBuzMcQ_nw2kzOg@mail.gmail.com>
Message-ID: <F5FE8FBD-1CE9-4009-AF91-E517271A9999@zytor.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On January 29, 2026 2:13:13 PM PST, Simon Glass <sjg@chromium=2Eorg> wrote:
>Hi Peter,
>
>On Tue, 27 Jan 2026 at 16:22, H=2E Peter Anvin <hpa@zytor=2Ecom> wrote:
>>
>> On January 26, 2026 7:14:27 PM PST, Simon Glass <sjg@chromium=2Eorg> wr=
ote:
>> >Hi Peter,
>> >
>> >On Tue, 27 Jan 2026 at 15:55, H=2E Peter Anvin <hpa@zytor=2Ecom> wrote=
:
>> >>
>> >> On January 26, 2026 5:44:43 PM PST, Simon Glass <sjg@chromium=2Eorg>=
 wrote:
>> >> >Hi Peter,
>> >> >
>> >> >On Tue, 27 Jan 2026 at 11:21, H=2E Peter Anvin <hpa@zytor=2Ecom> wr=
ote:
>> >> >>
>> >> >> On 2026-01-26 13:19, Simon Glass wrote:
>> >> >> >>
>> >> >> >> Including the EFI stub doesn't mean using EFI to boot is requi=
red=2E
>> >> >> >
>> >> >> > Yes, understood, but it adds bloat=2E More importantly it will =
lead to
>> >> >> > people assuming that the stub is always used and thus unwitting=
ly blur
>> >> >> > the boundary between the stub and the kernel itself=2E
>> >> >> >
>> >> >> > What is the actual need for this?
>> >> >> >
>> >> >>
>> >> >> I would argue that the opposite is more likely: someone inadverte=
ntly builds a
>> >> >> kernel without the stub, the bootloader goes down a legacy suppor=
t path and
>> >> >> things seems to work=2E=2E=2E except for some platform subtleties=
=2E
>> >> >>
>> >> >> The bloat is there, but it is small and is only in the on-disk ke=
rnel image;
>> >> >> it is zero at runtime=2E
>> >> >>
>> >> >> As such, I don't think this option is a particularly good idea an=
ymore=2E If
>> >> >> necessary, it could be hidden behind an EXPERT option, but I firs=
t wanted to
>> >> >> see who if anyone actually cares in a meaningful way to maintain =
this option=2E
>> >> >> Every option, after all, adds maintenance burden=2E
>> >> >>
>> >> >> Note that the BIOS stub is unconditionally compiled and included,=
 and that has
>> >> >> not been an issue=2E
>> >> >
>> >> >What is the maintenance burden here? I could potentially take that =
on,
>> >> >but I would first want to understand what is involved=2E
>> >> >
>> >> >The use of the word 'legacy' worries me too=2E Is this patch a step
>> >> >towards removing the non-EFI path?
>> >> >
>> >> >Regards,
>> >> >Simon
>> >
>> >(joining the threads)
>> >
>> >> Bypassing the firmware stub (BIOS or EFI) is really only appropriate=
 for special user cases, like kexec, because it removes the ability for the=
 kernel to deal with system issues at an early point=2E
>> >
>> >Does this dealing happen in the EFI stub, or later? Are you referring
>> >to ACPI fix-ups or something else?
>> >
>> >>
>> >> However, kexec needs it, and it's not going to go away=2E However, t=
hat doesn't mean we should encourage this in cases which doesn't need it (n=
o matter what the Grub maintainers tell you=2E)
>> >>
>> >> Now, if you are using KVM without EFI you are probably doing BIOS bo=
ot (regardless of if you know it or not), entering via the BIOS firmware st=
ub=2E
>> >
>> >I am thinking of the 64-bit entry point to the kernel=2E everything
>> >being laid out in memory ready to go=2E
>> >
>> >>
>> >> I just realized you are the U-boot maintainer, so I'm assuming you a=
re thinking of the case where there is no UEFI or BIOS firmware=2E In that =
case, just like as for kexec, the current entry point will continue to work=
, of course=2E
>> >>
>> >> What we don't want is having to suffer being on a BIOS or EFI system=
 but not being able to leverage it for the benefit of the kernel=2E The ker=
nel image is much easier to upgrade=2E
>> >
>> >More generally I am thinking about a simple and clean API for the
>> >kernel that doesn't involve having to provide 30K lines of firmware
>> >code just to boot=2E The BIOS entry point (if that is what it is calle=
d)
>> >is quite close to this ideal, even though I know it has shortcomings=
=2E
>> >
>> >Regards,
>> >Simon
>>
>> Yes, I understand=2E
>>
>> The 32/64-bit entrypoints aren't going away; it would be impossible to =
do so=2E
>>
>
>OK, so 'depend on EXPORT' seems good to me=2E
>
>> The general rule is: do things as late in the boot process as possible,=
 but no later=2E
>>
>
>Just on this point, I wonder how we should define 'late', in the
>context of EFI=2E For example, if the kernel stub reads a file, meaning
>it calls back into Tianocore, it is using both early and late code=2E
>
>Regards,
>Simon

"Early" in this context is before ExitBootServices()=2E
