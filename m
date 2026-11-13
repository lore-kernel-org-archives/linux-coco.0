Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577996;
	b=LvIIjPgG6HqdMJuq33UndlNdKR3762toYgAgkKCxFG3Jrrnpon8bFw0ifbtu86MqP4Ig
	 49T5i8apOXVOzU7TDbtwzFuqr8v3Wx4f+lqUAmpa+UtsvRjqUAsVBZUBNIF3GQwd9G0Bg
	 Yg4qbnj8ipMFQ3C/YO6Oa058Rej2T0RC5Rk7aX6pYev/Aw4GOf2i2dNxnN832LChnmQ0P
	 3YO0vN1fw2fK1v9dFfLBPiq0XE8DqV13kggsDNed7HgtVdwyKpsM8w0ORgbOsVKmjaW3j
	 ZIIOxy5z4Vt6uFE1tqiSBNGLcetuHXY177+6G1UhzGpZ84E7DdyQ237+L/HJPQdRuKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=6l5WqWAolDE7/fvkgj89NEfKlQfjgjFofvc+SFBHNQg=;
	b=ChKDfIMMKpd5BNfrxFO1dUHm5G72ZvpBidlrY69WIzX/Zq1kglhdoiRA69NhqCAE7jAw
	 1gzYN3uIqptzluM4l7vB8+c/LCaJCm04Bq7Ud5/icO3/IeA3k+aOF0CuchctPqu8b2Kol
	 ckvChwloF1NPRRLmO94ImEHmJS4g42xjrAcDAZaC+shb/ecTtTyn6DDJirFtl2cdQZrXD
	 way9oSgoQ8CixdB6VclhO9F4nk1ec1YbV2DLeuF4ITHXGKGAEpSu+nf89tyAOUNPa1tBN
	 Z56r3KYenTFRKSa7PfIip5VwsCfY3Akfkew4z9jvbnIknkY4XEavwP/HrkVZ8s0rQVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pIMvIcnF;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C69606EB25
	for <linux-coco@lists.linux.dev>; Fri, 13 Nov 2026 13:53:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1C69606EB25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pIMvIcnF
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ee1ed68286so3114745ad.1
        for <linux-coco@lists.linux.dev>; Fri, 13 Nov 2026 05:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577995; x=1795182795; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6l5WqWAolDE7/fvkgj89NEfKlQfjgjFofvc+SFBHNQg=;
        b=pIMvIcnFkMdVhhekYJn9ozYFBM9XdwAiUEf+c60pbzULlv30a6opxGk0dwp2caiI25
         9vFJVLDNN94HGr2dpX5LGsHu8kfAomTRnGfL/Vc/lrM68UF3We/bSHhn2dK+dk8qizO/
         /Bh1mudQezX+/IZomh+X6SorUSlUU/FOxAnm1ulz4NB+7Z7xIpe86XaCqy6/GlFZX4Pf
         koLIxOBMJs1GYzoMX+ZPri6if1pexGfZ+i+mXBmcw7uIcYj+3Vqhp0wrnqJMOjSP0/5B
         n+3C7ygaanux/252GxgZkRMm438AYJr5Forqfn0uqjsD9fdMmpIsfRWcXtCeQDX+duog
         qXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577995; x=1795182795;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6l5WqWAolDE7/fvkgj89NEfKlQfjgjFofvc+SFBHNQg=;
        b=FudZWYMPALf3HjXHrMj0tazgAp1VAR7uiB9PsunL+lnGD625V97Ag0JNMqvPItdSZ0
         00P2tPBG7K0Z6qyA8f6ZoQy2w+FshVBqF5ey3OqdOoT0zcuIbXP9KhrRnHiVIMVnvGIz
         nRbCS7TiehpsCUvekPiat6zvRiODCRKDg/lSwd3OcXw+yjnRe/6SzjTpBVzNcK1k0+A2
         gTRgGxjt3hFet3iDu+YHyLX4+342bLbFsPUIO84AX7hoAkh9xGZ3PqaVd3geCHnuERFv
         oNRrw3SHjSsZ3Np8qIFYUkjnUUbbZZOWg0WyYxJrAplJrSkOuZBHGHld6b1l/nhZZp1Q
         MO8w==
X-Forwarded-Encrypted: i=1; AL+hErEmZkoFkiDgD3HWlDKyv/tCuetViAYoi5ER4dj7QGLOioZ3zmA2zdSclXY+T6phTEOFToTjZ+3ZENZC@lists.linux.dev
X-Gm-Message-State: APuU4Z+HPeWT/pdiY8zwe0N9Om9pJknexmhuCKAbPn+TbdQrr/moa/5F
	kbIzylSgShq0iarepKJadaMQGeI/W2IMdGmyuMataOcZ+dnQu2eSz4028FiZ9H+v6iPtV8YIYxe
	hyMODlA==
X-Received: from plri13.prod.google.com ([2002:a17:903:32cd:b0:2eb:515:b000])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f641:b0:2ed:2a1d:e36d
 with SMTP id d9443c01a7336-2ee0de17949mr29320655ad.36.1794577994748; Fri, 13
 Nov 2026 05:53:14 -0800 (PST)
Date: Fri, 13 Nov 2026 05:47:39 -0800
In-Reply-To: <20260930001127.3170009-1-seanjc@google.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20260930001127.3170009-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441843259.82868.13458135372084486676.b4-ty@b4>
Subject: Re: [PATCH v2 0/3] KVM: TDX: Syntehsize SHUTDOWN on unhandled EPT Violation
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, kvm@vger.kernel.org, x86@kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	James Houghton <jthoughton@google.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Ackerley Tng <ackerleytng@google.com>, Vishal Annapurve <vannapurve@google.com>, 
	Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Tue, 29 Sep 2026 17:11:24 -0700, Sean Christopherson wrote:
> Signal SHUTDOWN instead of -EIO if the guest accesses an unaccepted page and
> has disabled EPT Violation #VEs on such accesses.  Returning -EIO is all but
> guaranteed to mislead the VMM into thinking KVM (or the VMM) messed up, and
> will likely result in the VM being terminated instead of rebooted.
> 
> v2:
>  - Return SHUTDOWN directly, via a new helper. [Rick]
>  - Ratelimit the error message. [Sashiko, (and past me, amusingly)]
> 
> [...]

Applied to kvm-x86 vmx.  I moved the ratelimit patch first, as Yan suggested
(ignore the ordering below).  Thanks!

[1/3] KVM: x86: Add a helper to prepare vcpu->run for a SHUTDOWN exit to userspace
      https://github.com/kvm-x86/linux/commit/def30ba0b6c3
[2/3] KVM: TDX: Synthesize SHUTDOWN instead of returning -EIO on unhandled EPT violation
      https://github.com/kvm-x86/linux/commit/a1b89df10ed8
[3/3] KVM: TDX: Ratelimit the "EPT Violation on pending acceptance page" warning
      https://github.com/kvm-x86/linux/commit/0b1431a34f1a

--
https://github.com/kvm-x86/linux/tree/next
