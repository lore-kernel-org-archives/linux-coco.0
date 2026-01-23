Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2050D2D781F
	for <linux-coco@lists.linux.dev>; Fri, 23 Jan 2026 00:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769127141; cv=none; b=b09DCtVRGXm9yc1VSlg67QPOW5TizE2SzmQDByiaNubbHitCt0Z/4DTkpXsRRu47pzpmwPfLmdU3jZOkl8oWO0ELFf250mCefcbOSjvrFX26P7VzvrFXhNnxYjUknO0IDXF6jv2fYy0TX06dlGCJw/p+5eRSkNfcmFgqnidE1O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769127141; c=relaxed/simple;
	bh=2gEBWPWCmAkBdN71OL6mI0scsA5CQq5nO4hs9jV+pIQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=lGARXOt9fvCZbz27exTHXc8YJmTk6Mzi0wUGLu3aIQiNlUr1Er0t4LPFGTCT7UtQtPmqoz/oukkZPqYzoq1Ypeq5oQstWG8ply4kg/SGQgxuaaWq4GrXXRP1WkDAYEDrn/AfHtaqngbMZMjtp0K0uAShEWTpkaTkxAUu1GMye3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=fzEh9SEr; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="fzEh9SEr"
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 60N0BVbm4145275
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 22 Jan 2026 16:11:32 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 60N0BVbm4145275
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025122301; t=1769127093;
	bh=LNURKIek5aFeosQ4J4ZJquDGaO+Trqe9o708gtN5DzE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=fzEh9SErycq418GfcG6K+dPOXwqKA8/kw6Ah+hND61EOhvejdzw69Uh+dkmh8UpbZ
	 Y0EwKc1M+A22AE75lhQa6OuOcnzBwVRNhFVOJsvwtqwPGr9MVb4SgSCYmJlcTzLWO3
	 2C9oHrDUZFT2UtIprodDHBxwEOrUp+NGvEeytwWFYbdZ/rR1swTV2oiJlJ23OIcoQ7
	 qngskCSNeHAFI0ld+zWgUE5B/EIQyivW7Nltby/1xdePAiP3y9pRdkkATkUqQiWOgQ
	 xL0uKLmG58gIxkKh7TZy6M7p6bdbIqiRmESieUgNKYpUy6EEqIWBXau5aOLbx6btGN
	 NBpbjeBhVEZag==
Date: Thu, 22 Jan 2026 16:11:25 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: Simon Glass <sjg@chromium.org>, ubizjak@gmail.com,
        linux-kernel@vger.kernel.org
CC: akpm@linux-foundation.org, bp@alien8.de, dave.hansen@linux.intel.com,
        kas@kernel.org, kees@kernel.org, linux-coco@lists.linux.dev,
        mingo@redhat.com, nathan@kernel.org, peterz@infradead.org,
        pmladek@suse.com, rick.p.edgecombe@intel.com, tglx@kernel.org,
        x86@kernel.org
Subject: re: [PATCH v1 08/14] x86: make CONFIG_EFI_STUB unconditional
User-Agent: K-9 Mail for Android
In-Reply-To: <20260122185740.50298-1-sjg@chromium.org>
References: <CAFULd4bV6jKqHb-vC47skjNvbctit3VccXpF02oYt0icaq1r-Q@mail.gmail.com> <20260122185740.50298-1-sjg@chromium.org>
Message-ID: <90DAAB54-CBF0-47BD-981A-FEDD26CDA0FD@zytor.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On January 22, 2026 10:57:39 AM PST, Simon Glass <sjg@chromium=2Eorg> wrote=
:
>Hi Peter,
>
>On Tue, Jan 20, 2026 at 8:54=E2=80=AFPM H=2E Peter Anvin <hpa@zytor=2Ecom=
> wrote:
>>
>> The EFI stub code is mature, most current x86 systems require EFI to
>> boot, and as it is exclusively preboot code, it doesn't affect the
>> runtime memory footprint at all=2E
>>=20
>> It makes absolutely no sense to omit it anymore, so make it
>> unconditional=2E
>>=20
>> Signed-off-by: H=2E Peter Anvin (Intel) <hpa@zytor=2Ecom>
>> ---
>>  arch/x86/Kconfig                  | 14 ++------------
>>  arch/x86/boot/compressed/Makefile |  2 --
>>  arch/x86/boot/compressed/error=2Ec  |  2 --
>>  arch/x86/boot/header=2ES            |  3 ---
>>  4 files changed, 2 insertions(+), 19 deletions(-)
>
>At least with QEMU the EFI protocol adds quite a lot of overhead=2E
>
>Is there any actual need for this?
>
>Regards,
>Simon
>

Including the EFI stub doesn't mean using EFI to boot is required=2E
