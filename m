Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657142E6CD8
	for <linux-coco@lists.linux.dev>; Tue, 27 Jan 2026 03:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769484148; cv=none; b=GajvFC3LaXzCIWosvwutnT7yLCY0wL8e08OHzRnVjXKd0GKpUS0aF+mu/Ax3/OPwkA9hPRpsPP04ElRUICgZw3FlzLXaBYzrWg/KgIgkrwdPnsFIfL0BsjuhqqVKlX07ypVhLANhz+KQJc3yv66grXgXVbLLiGIBuEWeBp5r2Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769484148; c=relaxed/simple;
	bh=TqWShA7nonkNMMeS/R2vOEME6iRHZIxiNrHvnZBPKLo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=W9eI+hLckPUDeJbRZHDRMtE+wlu7sJCWkzvtl+8MHWsnA/tO6HxxOeXI9nGhb+1YFkk6FeV/kCBo+MUBB3AQcwhcnkXQWRB8SZhVPVNCPjtjV2tizbKHvFHz1mRv22LnPorwTWEy0vbTX8BtBWaehLzesA8EJqsxblGPkZjQQCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=Rtnv3Sa3; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="Rtnv3Sa3"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 60R3LqZ13399906
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 26 Jan 2026 19:21:53 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 60R3LqZ13399906
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026012301; t=1769484114;
	bh=TqWShA7nonkNMMeS/R2vOEME6iRHZIxiNrHvnZBPKLo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Rtnv3Sa3n5CtSaWws/0GStwQ4y4O6RAuQWc6PYWJ2/rq6KpdbtHtJglI+VB9L9nsU
	 fuGW9N9/rdy0VyqoUouy9DMCE1m24NUGCy/DvXcK9Za7op2+oUztbJkcKYJ6kya8gH
	 tsqUGUCjcJtUuvQru7CBO0hY1gpflkqcHP+Cx3yHc6iRaMuYGXnsFi0TwA6S2q7XU+
	 tt8sROJwQdnehQ4MaO55dPMghIaSxLBcj9PDt5MaO0PzDRizoJSxsqvv6t17YeYfcz
	 68tN/68+YKPPWbLyj2oXdmWaRnCm2IMZlM8Z1B80TsNBIoZflEGAqSG3ME6dnqzZXk
	 zdvsGXdd0uJTg==
Date: Mon, 26 Jan 2026 19:21:47 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Simon Glass <sjg@chromium.org>
CC: ubizjak@gmail.com, linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
        bp@alien8.de, dave.hansen@linux.intel.com, kas@kernel.org,
        kees@kernel.org, linux-coco@lists.linux.dev, mingo@redhat.com,
        nathan@kernel.org, peterz@infradead.org, pmladek@suse.com,
        rick.p.edgecombe@intel.com, tglx@kernel.org, x86@kernel.org
Subject: Re: [PATCH v1 08/14] x86: make CONFIG_EFI_STUB unconditional
User-Agent: K-9 Mail for Android
In-Reply-To: <CAFLszTgHvFvB=Be=MwctUfR4ngA=rxxHHP1A1M-XvXbT8yN9JA@mail.gmail.com>
References: <CAFULd4bV6jKqHb-vC47skjNvbctit3VccXpF02oYt0icaq1r-Q@mail.gmail.com> <20260122185740.50298-1-sjg@chromium.org> <90DAAB54-CBF0-47BD-981A-FEDD26CDA0FD@zytor.com> <CAFLszTi+N7Yj0yYHKroypmBoFSx+9m5er8pgULsKbPuooFYj-A@mail.gmail.com> <643bfc24-8cc1-4f70-85e2-f6829c8e03db@zytor.com> <CAFLszTjhJkfBrG-QiF6cEz-K1ODHPziJDsTthBUsqoZ=hDxsjA@mail.gmail.com> <E15F74BD-E33C-4184-B694-C152696C4895@zytor.com> <CAFLszTgHvFvB=Be=MwctUfR4ngA=rxxHHP1A1M-XvXbT8yN9JA@mail.gmail.com>
Message-ID: <36C4A641-A124-4082-884D-90AE22B10275@zytor.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On January 26, 2026 7:14:27 PM PST, Simon Glass <sjg@chromium=2Eorg> wrote:
>Hi Peter,
>
>On Tue, 27 Jan 2026 at 15:55, H=2E Peter Anvin <hpa@zytor=2Ecom> wrote:
>>
>> On January 26, 2026 5:44:43 PM PST, Simon Glass <sjg@chromium=2Eorg> wr=
ote:
>> >Hi Peter,
>> >
>> >On Tue, 27 Jan 2026 at 11:21, H=2E Peter Anvin <hpa@zytor=2Ecom> wrote=
:
>> >>
>> >> On 2026-01-26 13:19, Simon Glass wrote:
>> >> >>
>> >> >> Including the EFI stub doesn't mean using EFI to boot is required=
=2E
>> >> >
>> >> > Yes, understood, but it adds bloat=2E More importantly it will lea=
d to
>> >> > people assuming that the stub is always used and thus unwittingly =
blur
>> >> > the boundary between the stub and the kernel itself=2E
>> >> >
>> >> > What is the actual need for this?
>> >> >
>> >>
>> >> I would argue that the opposite is more likely: someone inadvertentl=
y builds a
>> >> kernel without the stub, the bootloader goes down a legacy support p=
ath and
>> >> things seems to work=2E=2E=2E except for some platform subtleties=2E
>> >>
>> >> The bloat is there, but it is small and is only in the on-disk kerne=
l image;
>> >> it is zero at runtime=2E
>> >>
>> >> As such, I don't think this option is a particularly good idea anymo=
re=2E If
>> >> necessary, it could be hidden behind an EXPERT option, but I first w=
anted to
>> >> see who if anyone actually cares in a meaningful way to maintain thi=
s option=2E
>> >> Every option, after all, adds maintenance burden=2E
>> >>
>> >> Note that the BIOS stub is unconditionally compiled and included, an=
d that has
>> >> not been an issue=2E
>> >
>> >What is the maintenance burden here? I could potentially take that on,
>> >but I would first want to understand what is involved=2E
>> >
>> >The use of the word 'legacy' worries me too=2E Is this patch a step
>> >towards removing the non-EFI path?
>> >
>> >Regards,
>> >Simon
>
>(joining the threads)
>
>> Bypassing the firmware stub (BIOS or EFI) is really only appropriate fo=
r special user cases, like kexec, because it removes the ability for the ke=
rnel to deal with system issues at an early point=2E
>
>Does this dealing happen in the EFI stub, or later? Are you referring
>to ACPI fix-ups or something else?
>
>>
>> However, kexec needs it, and it's not going to go away=2E However, that=
 doesn't mean we should encourage this in cases which doesn't need it (no m=
atter what the Grub maintainers tell you=2E)
>>
>> Now, if you are using KVM without EFI you are probably doing BIOS boot =
(regardless of if you know it or not), entering via the BIOS firmware stub=
=2E
>
>I am thinking of the 64-bit entry point to the kernel=2E everything
>being laid out in memory ready to go=2E
>
>>
>> I just realized you are the U-boot maintainer, so I'm assuming you are =
thinking of the case where there is no UEFI or BIOS firmware=2E In that cas=
e, just like as for kexec, the current entry point will continue to work, o=
f course=2E
>>
>> What we don't want is having to suffer being on a BIOS or EFI system bu=
t not being able to leverage it for the benefit of the kernel=2E The kernel=
 image is much easier to upgrade=2E
>
>More generally I am thinking about a simple and clean API for the
>kernel that doesn't involve having to provide 30K lines of firmware
>code just to boot=2E The BIOS entry point (if that is what it is called)
>is quite close to this ideal, even though I know it has shortcomings=2E
>
>Regards,
>Simon

Yes, I understand=2E=20

The 32/64-bit entrypoints aren't going away; it would be impossible to do =
so=2E=20

The general rule is: do things as late in the boot process as possible, bu=
t no later=2E=20

