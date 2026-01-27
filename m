Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9614D139D
	for <linux-coco@lists.linux.dev>; Tue, 27 Jan 2026 02:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769482532; cv=none; b=qKJwzdgM3C+mDl3CwAFpwApqjWc6ScPL82QiEugIFcYtnjPLyan7gsVZUa21wVMFl4p+z7QC5HBMBSr+8hrwYn0GHX3p9DPvIxhGdu89JIcr+YYwRmnXC3ZppXfoXLjEBY42PwwkW385fs9EjEyi1ACgjIpmmCJ2BJUtPUbr+8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769482532; c=relaxed/simple;
	bh=XhAYbyTeq0S5YxS64diYkyBhY3z+urlrv1bsyExoqsQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=EHZf2iSE8R0VckBkWKFSFkqizYVXNc5bEzNQ2iqJDTs8MP+nYYz5is5R/IusmcZs5lqI69bsAUCPB2GbMo3I5N1vkiHljySQGnKBpnAI64igeaY/BxSen38mApzZPD4crajjou65hoIkO4nwBd8c6wmZtIgr5i4az0tOUe5i/io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=tuHbWpLj; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="tuHbWpLj"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 60R2t4YX3390143
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 26 Jan 2026 18:55:05 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 60R2t4YX3390143
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026012301; t=1769482506;
	bh=XhAYbyTeq0S5YxS64diYkyBhY3z+urlrv1bsyExoqsQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=tuHbWpLjKz+CwofmS6u7yjySJgbbtuI/3bP4YMzPTlhf7ucrvyAwHwGae+GBxO0Oi
	 iByAmBiMSQJx7hq3fjMOOJui7+jGv/VL7nlBm6cns+vGYOzmu8jGR/ZoH9tocITG1j
	 vIxovjA9DsTisj4PBhpfGtixm4knQmcp3B7vB4nu3n58B/2CW0sc7BIZLIpWU66RHh
	 Ev9kygRzhXzTBoHf5UVt8ULUilA/1P5uNwyf/LB090UwOr3wzEUDjEKXVk54aV1H+E
	 EH+PhRk7ELpsENDQWUsQYtaapjN/eqBCgI6LRSSyVB/K5ztB+gXh89SG3q0p68SuAW
	 oZFBSl+MpqWOA==
Date: Mon, 26 Jan 2026 18:54:58 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Simon Glass <sjg@chromium.org>
CC: ubizjak@gmail.com, linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
        bp@alien8.de, dave.hansen@linux.intel.com, kas@kernel.org,
        kees@kernel.org, linux-coco@lists.linux.dev, mingo@redhat.com,
        nathan@kernel.org, peterz@infradead.org, pmladek@suse.com,
        rick.p.edgecombe@intel.com, tglx@kernel.org, x86@kernel.org
Subject: Re: [PATCH v1 08/14] x86: make CONFIG_EFI_STUB unconditional
User-Agent: K-9 Mail for Android
In-Reply-To: <CAFLszTjhJkfBrG-QiF6cEz-K1ODHPziJDsTthBUsqoZ=hDxsjA@mail.gmail.com>
References: <CAFULd4bV6jKqHb-vC47skjNvbctit3VccXpF02oYt0icaq1r-Q@mail.gmail.com> <20260122185740.50298-1-sjg@chromium.org> <90DAAB54-CBF0-47BD-981A-FEDD26CDA0FD@zytor.com> <CAFLszTi+N7Yj0yYHKroypmBoFSx+9m5er8pgULsKbPuooFYj-A@mail.gmail.com> <643bfc24-8cc1-4f70-85e2-f6829c8e03db@zytor.com> <CAFLszTjhJkfBrG-QiF6cEz-K1ODHPziJDsTthBUsqoZ=hDxsjA@mail.gmail.com>
Message-ID: <E15F74BD-E33C-4184-B694-C152696C4895@zytor.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On January 26, 2026 5:44:43 PM PST, Simon Glass <sjg@chromium=2Eorg> wrote:
>Hi Peter,
>
>On Tue, 27 Jan 2026 at 11:21, H=2E Peter Anvin <hpa@zytor=2Ecom> wrote:
>>
>> On 2026-01-26 13:19, Simon Glass wrote:
>> >>
>> >> Including the EFI stub doesn't mean using EFI to boot is required=2E
>> >
>> > Yes, understood, but it adds bloat=2E More importantly it will lead t=
o
>> > people assuming that the stub is always used and thus unwittingly blu=
r
>> > the boundary between the stub and the kernel itself=2E
>> >
>> > What is the actual need for this?
>> >
>>
>> I would argue that the opposite is more likely: someone inadvertently b=
uilds a
>> kernel without the stub, the bootloader goes down a legacy support path=
 and
>> things seems to work=2E=2E=2E except for some platform subtleties=2E
>>
>> The bloat is there, but it is small and is only in the on-disk kernel i=
mage;
>> it is zero at runtime=2E
>>
>> As such, I don't think this option is a particularly good idea anymore=
=2E If
>> necessary, it could be hidden behind an EXPERT option, but I first want=
ed to
>> see who if anyone actually cares in a meaningful way to maintain this o=
ption=2E
>> Every option, after all, adds maintenance burden=2E
>>
>> Note that the BIOS stub is unconditionally compiled and included, and t=
hat has
>> not been an issue=2E
>
>What is the maintenance burden here? I could potentially take that on,
>but I would first want to understand what is involved=2E
>
>The use of the word 'legacy' worries me too=2E Is this patch a step
>towards removing the non-EFI path?
>
>Regards,
>Simon

I just realized you are the U-boot maintainer, so I'm assuming you are thi=
nking of the case where there is no UEFI or BIOS firmware=2E In that case, =
just like as for kexec, the current entry point will continue to work, of c=
ourse=2E=20

What we don't want is having to suffer being on a BIOS or EFI system but n=
ot being able to leverage it for the benefit of the kernel=2E The kernel im=
age is much easier to upgrade=2E
