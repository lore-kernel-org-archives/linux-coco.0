Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB76E31CA4E
	for <linux-coco@lists.linux.dev>; Sat, 30 May 2026 16:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780159679; cv=pass; b=FGKKz7PQpArBC8F+Egt7KAHTGwt0GGX+DI8/zYBwPb+y/d+pFGxtxiBrBxd+5EOfyzKxKwrak3yiroqN69d7fAdYFwbrEyB5kE+ch/tbg0f3eqQR5dZGyucP0H2irVn4UhJ4XBBGhbOlCunS8EeCGaOBtQTIdNB34LvMg8R16ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780159679; c=relaxed/simple;
	bh=NO55GTUIErfjMW/u3wp6zeJt9pZ5TEdqDypSXTrdktw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=DWr3jmBjGRU9N46pCwEhEK68x3rfAB96OzvYRNDFJfcZ5BGqDaReR6CJOElaLiGdvmiKVTuothBY8tYX4Mh47ZEvzv0PHkymdXQ47dFW5PW8BH6f6eWUj8BsJcu9xMDIP3e9aD5TTeZmQBxLar4ng+k+xyEhs7uB1Lg2HO3rzbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CviO1rN7; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CviO1rN7"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-68be16c61d1so3333048a12.2
        for <linux-coco@lists.linux.dev>; Sat, 30 May 2026 09:47:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780159676; cv=none;
        d=google.com; s=arc-20240605;
        b=JnMOzOCIA9L0WOMofp91Eii2M6moXTsKshs15gEn4QzU7BBlOlPltBCAd8cMB9zJck
         hTJ3/8FZCKXHJSE4Vc9ZZuBw6k88LuDidEaEPKKp1VEyjYZp9cn4pZ1jxUHBU1pu0wEN
         +vaN+Q1Mbiw8ncpoeqfS8SEzi7oJru4UrECbkUQ2GBoik/F9Jm7aCJjQ5aN2PnMJhw7v
         fkLkM/CgWktRYi/Dma8lanl30PePi86tbNJ1c23mNeBryZMpNm0nku3EmNoRvFsoUK/y
         UTwz6sEmJdchWYlSK1gMsQAzU1/QWq/8B8dLCPEg6DCT6PjwE2Tmz0Tw6O7hZ3LceLzN
         9Iiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=uDjMWTL59bSew6EuBBjyiKQsK4J1StRuWvcVY3hIZ9s=;
        fh=hrf6AFXrugI5ldWQP1V5G+QAqGikLZTRJIJYUwNCqlQ=;
        b=gi/OcCKbUfeI1re7a8nRgcNSr5yjP7yPNbjzhhrCYuuigq6rhtBEz8h4pqZk4Vu4+Y
         2ERis/F7rgnjTsdqMXVcgaElhrPE6xmsO+YKzphWY+hJ9zPIBc7MkO994iE1M/9Iiz1b
         qcUVz7m8tkeFKbQy0GX+KsJUZLVeUiUXcun4vTTzhHNjSmoDGEYcPaa6gE/9oVe/wPrt
         d6veM5bsK5xdEx5cZ9bYONeiPYBB3IwQW7Rrl1tkf23TcitGw+16IWGZ/x/p+DBj5ne5
         ANoW5MQA0UXyjJ04NhQzvZ5q7eDc6YPo8EEwxxYaCnR/fIpX0Ir1icsgXBbjU7OW11+3
         Jwcw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780159676; x=1780764476; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uDjMWTL59bSew6EuBBjyiKQsK4J1StRuWvcVY3hIZ9s=;
        b=CviO1rN72lw7ofxwoBABaTeyPHqwqbttUjvsSMrCbgLPMHMaf7lt1kOE+K9obj7Ibg
         iUM3mZ56tQ/VgwBDHlEJQYrUTTcNMljj0V8U7FrA8hxmJYEIfQfCvdU04ZWsOzTGV987
         VvaeWAXu7s0TuO2ehjfdP4L33JgUtka1+A0nUe2OAMg+d1ouNjhRF+Brm4I0o9ub7Xqe
         zBwtSHR6/7G9WQkW2p5JxDrLMVKyAkrlJw64OWG8Jjr3Uum2xzBkMYk+Q4wXUG312BQb
         T/GbVkCFdW/Ln3+jaxi0KFMvEdfSBBnrpHEeghyFzlLTqw6h46MnYAWvCUzuYBXkDxBi
         O1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780159676; x=1780764476;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uDjMWTL59bSew6EuBBjyiKQsK4J1StRuWvcVY3hIZ9s=;
        b=YV3zPwIxOeU40aIdyKxtDBEQVFvQRg7E76d10MYwlfdCH+BL8aPWhYhfCacw+0hPRs
         l0dc7uE8GYV+DeFcw0fIHCAPNEo9bKT4IxSucuZqJh4LI60VX33/TcTX9n9aoYadzQ+m
         5YsNDp7yFLJW5cOzfSviNVwixVkGTH/DHoOotrVP+0PaUCrj40eTINrdFyCzCYIHCmWo
         ChGqclOFF+FTR2mQCmcQLzDoGk/6ytSBt0hy8r1C/Q5e+uR5HERVb7OFQHdkGT/ccIio
         Dy7EYWVyH2RLhVqpEbEtdlApYzjh6TPwLa0lpfdJUjc0UPkl8J7VofB3HWYglOlAkjoI
         aLlA==
X-Forwarded-Encrypted: i=1; AFNElJ/H9TjbDrd92OxtEOc6UqpsGLacFCURlzXJ17XE4yPJSkmwyt5ig60KjNwlATS3rlJp9ZnIpkHK3nSH@lists.linux.dev
X-Gm-Message-State: AOJu0YzkjGr9SUl1uCCrhOmf9k703wLQLnxr1gvBg8lG2vhY3/Xegxr5
	3XDaA99GixqDvymivYRgNM61gQFK0C4Ll847UiQ/YiYsVWzr9cf4exmHtnT4McpCO1LS1ckSIXh
	XIyW7JWEJs0ex8UAy2ZiywoXRd1aMIJY=
X-Gm-Gg: Acq92OFjMb80gM9Khv1KDHGHs1XeyCsy/Q/hpOxl2lLa86qcrKrzmwVbWsbUNCWqSlK
	jz025utb+A0RZeleK0n9N5Glt0NvMdPiXd1XBkXh7ERGnrdFn4lPPxNvSLpZlewP1AnR9I2ukc4
	gEVpmg1+v7GYx6CGRvX4KBMNns+qSaxi0PGsznQKXmWWal/qjPXuaUDaJSVES/v0rmXl82X3imj
	D4DdxMOIaRCHkTPNo9U35mf+76iIeXwQ/xLVsV7z62HAY7qqt0MYmseCtBmVIKRSV6ErEhL8bvU
	lwzyuxY3J5TsmSsvHIuxEHzxAHGMW3M5HAthPYTHMx8ncTJ2wg==
X-Received: by 2002:a17:907:80a:b0:bae:d29c:4e28 with SMTP id
 a640c23a62f3a-beab3850c0emr227580166b.12.1780159676193; Sat, 30 May 2026
 09:47:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Sat, 30 May 2026 09:47:44 -0700
X-Gm-Features: AVHnY4LzRI4mtM2MVMA9vVPgTReaIAtSfV8wr74SnOQ4vnVCBcmxdNjiRFE8TOw
Message-ID: <CAKSQd8XBoaUf7MyvPJCv_DHeuEd-DtRYb5GnAofkbJTP89LLMw@mail.gmail.com>
Subject: Re: [PATCH v4 15/47] KVM: x86: Officially define CPUID 0x40000010 as
 PV Timing Info (TSC and Bus)
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Stephen Boyd <sboyd@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org, 
	David Woodhouse <dwmw@amazon.co.uk>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, David Woodhouse <dwmw2@infradead.org>, 
	Michael Kelley <mhklinux@outlook.com>, Thomas Gleixner <tglx@linutronix.de>, 
	bcm-kernel-feedback-list@broadcom.com
Content-Type: text/plain; charset="UTF-8"

> + *  # EAX: (Virtual) TSC frequency in kHz.
> + *  # EBX: (Virtual) Bus (local APIC timer) frequency in kHz.
> + *  # ECX, EDX: Reserved (must be zero).

Can someone from Broadcom please speak up as to
what a non-ECX value signifies for their HV? (Asking
because I see a value of 2, not a must-be-zero.)

--
C.
