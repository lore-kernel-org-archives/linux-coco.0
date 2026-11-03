Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793699807;
	b=qUouR0suxgjhG3n8M+/F86E9n7u9Vx5Al/MQhfrUQoU3eF0M4rslmcdMxUS65dfa5T/w
	 o0RdbKeMP5v3waN3LU/ZevyitcVAs+tymtk3cHNDVn9lniD6uZbTKdxa/gK8wCEWIEJs4
	 7TiUy3bfQtrg/7maZ4AP2E2rA7MH4ZYYmXV5n5UE9r3CwruVxhZ+2UWVgbtBrSexp0f4L
	 d/nQ1wG7jtlRs9SB+0+qPlgEW5uwkhiYTc0Yxey7k96xejmVypTQCPJjWUTMnDn6axKHy
	 sXISQjr1z+jAihcTvKSW3Tne1Xw5ROA1E4YBQe6b53MbnL9xx7MKgDPgLp+ATu1QtqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=iqwD6eaHeERb7Ot7SCnGyIPnO7ssTxQvxGidKCgiKP8=;
	b=gSrANhBjd1gngdqrk5rNKR7bFL9+qhQ0HFuB9k4cI7jkB8YDvTvmG/X/1t0upT9hxZSy
	 BN0G/g2giwx6tI9wVgN+9/QtUew9JGFQOj0Ka/HxyKMCuW5bMxMrPFjSgI14BafvIB/qi
	 0jGtWM76Mnne721Jqp5sSI2Qw4P+NG+ai3Yo1sC29Jp19ncOLtDmndyd+ADlg7HdgksHX
	 c9T5H2O0DT0SIA/GM3rSor5o5MyhxRzen0koGGHy0NuX3nkjls/Vly2W9BRPuP6FfeXF3
	 cSJCFIGJu7rLekCc9MwC4vmep0dbXwLEEMD1od6y/wW02lm5Fy0EvO4KVxcQWcX2hww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flashbots.net;
	spf=pass smtp.mailfrom=flashbots.net;
	dkim=pass header.d=flashbots.net header.i=@flashbots.net header.a=rsa-sha256 header.s=google header.b=RA07tJ5M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9D9606B374
	for <linux-coco@lists.linux.dev>; Tue,  3 Nov 2026 09:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE9D9606B374
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=flashbots.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flashbots.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flashbots.net header.i=@flashbots.net header.a=rsa-sha256 header.s=google header.b=RA07tJ5M
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-844a8bf7e25so2729343a34.1
        for <linux-coco@lists.linux.dev>; Tue, 03 Nov 2026 01:56:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793699806; cv=none;
        d=google.com; s=arc-20260327;
        b=m3Ad2JUyY0ZF3ry3dHmWf4LeIE5bXn4X1ePWuLdi9Y8navfydfiNI7fvGfbYwGoSLJ
         h8XPEhqpkyJ0xLlzN5jSZUZDOH6K8CnWrN2PSsqYBZlhCzCSx/cAtv/10vznrqzFAUOG
         ofkFI2sMrXzLowg6FPX9vDFhz5NIbDe9+TDF6duYEuHQUwHRv2sa5u9v1XOYV7SCiW2F
         SXqRWfEIqf/l5FuUtlaHHD7XKxhOzJLPbWluHC3Sxb47HHWLso7CGlruWw0h4llBCL98
         p7X8gfxFX4TlbZfg3VFOZshUIlUDJm/ZZKBYte/dd5bdO9mmBXhFQa3sIsCMIiUoIYAB
         iwUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iqwD6eaHeERb7Ot7SCnGyIPnO7ssTxQvxGidKCgiKP8=;
        fh=5pUNB35obwtZr635/kYNPn/R9GJ7wuz+Kn1zLtkKAIk=;
        b=WUfkStCEwUPtIo0xa5sCxcwM16KFOADmsD7F/7Oo6alv007dQvJTRnYWMp9MI84Zkf
         v7vWOsgWTbTisQJUlg6rEOFlssmdFYvZtqFZL9zjUYSrh8o5/5RjaERHlZJ4FnDG8KNv
         RFXXgBrxm4E2wQeJ/aF5FGNVHgxswbVBpODowxQg5JypUhZME9Ukhcsir5bQnu+6LzyC
         7xy3oDZFgObnyleuWHFja4bE6m3FVQoSZJQzWQOhGeAASepVXSljvD19IFX4KkQ4krjp
         MXHyhptPCI+5XNMwxim740uLaCdBZuS9rihhAkGpaX7F1WI7NQbmGjUZEMdBKAPo2H40
         kS5A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flashbots.net; s=google; t=1793699806; x=1794304606; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iqwD6eaHeERb7Ot7SCnGyIPnO7ssTxQvxGidKCgiKP8=;
        b=RA07tJ5MXlzORc2/8a84BPo57UEgV8na5iHu2ZLFFUyk1FLeErIhWpAhAoiKbPt1R3
         Z+/8SgLYlPoZeN1orYm+WPzLRTaR4dbv3V0SimZblLmr9a2+sJKpgnqhv2AGCf5oCUBK
         /Kgl3LSIyNlroI/4eB/d3EX540jrSOPMFO/sgBewSD25bdKPnfss1GPnuooxtONG9jqS
         iwOSLYYlGYGXIfMiv3+SPFDzTiWoe59hbr12P1rRR8PgVJdeTsYyyx1dY9d5gsiiVAYe
         D5pT2jd5jDdYnO/cEu94rpjWcT/5k0k0VmGalHaZVbxgs5D/PFi/6xR5f0xC+qqu6xZP
         FBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699806; x=1794304606;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iqwD6eaHeERb7Ot7SCnGyIPnO7ssTxQvxGidKCgiKP8=;
        b=DJaB9ZKo5mreTShLN9267kgudOyKSRn7U+NdAA9FwIShehRePII25UCJOA3LOBPvRF
         Hd0j+GQ2C+zEwZuvub9bYlWUKX9zJmcX4xnnkmwcBxNaA2FJ9wQT8wq5R0Iq7dBtsEbt
         LV8JhYNfdIUx5sKhn37mfhIjLAmqcqM3XPw0LOedaOh9blxlg6LJVHRZAXvTk70Wp/CX
         hdq6AIsuextQeavsMYNm/+aTMaTDO+CdCFOUs9VvjqE1qAG+0qNxe93pMDumnBYqRE01
         LNIqcgV2QUm+GVTYGw/y/JiTyheOutDbWNDTQYhqIteCOnC4rUNpifztLyUnkW2PNxCV
         x8kw==
X-Forwarded-Encrypted: i=1; AKwUvBwzIUu6VhffePKkdTlZf6Ef//8HBSdONsY2vd+LJ5TEHrYj05/JTPkGzdzQEZakLi9zlwagjgolvdpa@lists.linux.dev
X-Gm-Message-State: APuU4Z9w8Z+prxf3VHiTKM3AbfuQhSdeWxlh1Pi8ABKawA/2DVbZx6ay
	pJS8BcrO2FZEhPXxU7aIpLnpyTzJOVc3+9o/ppV9RmbPHGI94rZQlMdqu8IBSjbDeTfV2ZPAWpq
	LwZxrHo1cVU5ZUc+F+bIhkbS3CQP0XZJGRxWManqawA==
X-Gm-Gg: AYBFou0LocgDLGqsCo6hGiAvZGWqcDduVr8ozeaCVKYfjiifnjOohAVPGYjQQzw8e9l
	pXkkFc1vf2FQDu4foYxFD0rao8kVEEL3he3ot2lvdd9aRRO5DG87VeZ4X4AlQ9HGljcu2EMTghA
	I2A2VdJhm2/b1vMz98XT/BIYZl/2Ab57KqHKIaTU+ahg+zPjEOtwAZxrtp6Shh+R8JuaiWAqLTS
	ur+UGadN3nl8xSwcef+f9mXFarq4Vjmwf/CzL0mzSRkvVGjbGtMxj5vk4QUChqrbU59UyXLxVlk
	AK5pPsb9EN1csMQYqnodHKyk4JqzBK0T5FSAk1N8gmtvYVgd9V1ibEmtL0lNUkVPTsipU1WY/sl
	BZuGKPVHkJbP2wUV3odh8TGdfpkRj2r8VgoixmSDoa+T52SCW5QT2Bp5LOmXjt0Jes8o//8Dj7a
	0ns/CL/P6UQjNO/NEq2Qnskp7VaWIKg+/C7SkD
X-Received: by 2002:a05:6830:4c05:b0:844:4959:e855 with SMTP id
 46e09a7af769-85d3636d94emr9384433a34.6.1793699805932; Tue, 03 Nov 2026
 01:56:45 -0800 (PST)
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261024-tdx-guest-quote-poll-v3-0-6a83bb767314@flashbots.net> <3b582cdcfe37f1d01ee71611ab2611f845261089.camel@intel.com>
In-Reply-To: <3b582cdcfe37f1d01ee71611ab2611f845261089.camel@intel.com>
From: Moe Mahhouk <moe@flashbots.net>
Date: Tue, 3 Nov 2026 09:56:35 +0000
X-Gm-Features: AclHuK8Doz0oEKFnQPO1b0h9OeAQOCO7SR7lLXwryMRNxDi7qBGsHP1Qzst1PTE
Message-ID: <CAKV3HMM9BKpmgWeFqRqamAsqqiofj+TG4DrOEHmbUyE0FjA7+w@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5B=F0=9F=9A=A8ext=5D_Re=3A_=5BPATCH_v3_0=2F2=5D_virt=3A_tdx=2Dguest=3A_Fi?=
	=?UTF-8?Q?x_and_speed_up_the_wait_for_a_Quote?=
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, 
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	"kas@kernel.org" <kas@kernel.org>, "Aktas, Erdem" <erdemaktas@google.com>, 
	"djbw@kernel.org" <djbw@kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Miao, Jun" <jun.miao@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 2026-11-02 at 19:55 +0000, Edgecombe, Rick P wrote:
> Long term though, isn't this a better option? This patch is
> essentially a performance optimization.

Agreed that interrupt-driven completion is the better end state where the
VMM supports it. But I don't think it can replace polling.
SetupEventNotifyInterrupt is optional in the GHCI and enumerated through
GetTdVmCallInfo. KVM only forwards it to userspace (since v6.16), and a
VMM that doesn't implement it returns SUBFUNC_UNSUPPORTED. So the guest
still needs a polling fallback for older KVM/QEMU and for other VMMs.
Patch 2 is about that fallback.

> Polling is always going to be weird. And when the attestation speed
> changes (possible in the many upcoming attestation plans) this tuning
> could again be suboptimal.

The fixed one-second interval is the tuning that ages badly. It puts a
one-second floor on each Quote and, with quote_lock, caps a TD at about
one Quote per second. The backoff assumes no speed: a fast Quote is
seen within a tick or two, and a slow one at most 100 ms after it
completes, with at most ten wakeups per second.

Polling was originally chosen (f4738f56d1dc) because Quote generation
was "not time-critical or frequently used". That no longer holds for
users that bind a fresh Quote to every connection, such as attested TLS.

I'm happy to work on event-notify support as a follow-up: use it when
GetTdVmCallInfo reports it, and keep the backoff as the fallback. Would
you take patch 1 now (a standalone fix, Cc: stable) and patch 2 as the
fallback improvement? Or would you rather see patch 2 together with the
event-notify series?
