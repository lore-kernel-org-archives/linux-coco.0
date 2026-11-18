Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794984021;
	b=mOZP0nKjBv+d3QwprhxTj9fnXe+OtnTrOVv4br9o8i3vnSp3E3MVaHHHUJPvryK1mjK3
	 So8jstWf2qr9ufnPiLm+oe2lkzrPNuAMIRsenjt+++Ih1sUdp9JbJ4tRwulHa8L8PQMZa
	 QjoXSfMsKyUkLIKQO0ZkEfeNElOHazgdLY5bTMtqINz8JVqdBlWOX+3d7Tuezq7Gh8vK0
	 P/g/iOhi6wux8Qqao/CWaJElei5FpJqDLMk9R3ec5Qz6jeCt26C9bCFLyDND1DiUHKLzD
	 lYeFSZsDc0LWvW4TVWLVTQvrUK4JX2lP4CVQfjLxhYIpDPRgBiclJj3DV1Yxkat4vuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794984021;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=BN2eMBIZKP4IgFzjpmqX87SaP1ERJDhlfNIPjHVFBk4=;
	b=VGXOqN6yDHWLKE3lbSAkWpJE326PsXqra5hQ+MDqE/dVFARSLjThxME66a6FNiVoFPaZ
	 TzILHF9yyVM5rJkEJNlqdFf6wpkFv6qAxB5jH47SWcoEmlvyb0Qe5eGIG+AnTjFBP3OqH
	 HKxalEMAyPXcqd5c+TzJexwN2GfnraeYk++xhyDaDlzR1mEUIJz73fmXLDvXezsJbFlxR
	 cH7UfCa5/cXMNqmpvzfwj8WFEiJMbkZGVyzL1MszDtXG2tZKw++1A2NtK1G+rZF32Qdj+
	 7/HTcfmKZwxsOsYWPy8fAF3EvxgkjWc+9NHg5PbAhv74kzmiQJx4HtPbD70Jg/ze+7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=MP2e6cbu;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41350606A32A
	for <linux-coco@lists.linux.dev>; Wed, 18 Nov 2026 06:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41350606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=MP2e6cbu
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b12cb3c37bso287343a91.2
        for <linux-coco@lists.linux.dev>; Tue, 17 Nov 2026 22:40:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794984020; x=1795588820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BN2eMBIZKP4IgFzjpmqX87SaP1ERJDhlfNIPjHVFBk4=;
        b=g+3qrffR+3ZQoA/jJAidjqIQNy9IKshD7mhyuVnV95Lf1vUR7RK4twXxoMUBc4Ac0z
         eEhi+nK/88EB4+hPxVQ1qhhP26Fu8aeBooHQCk7WyAWKuo6M4ZV44D8La05wvVTXoFjD
         bBoMh29dleSsjlqfeNJlSUV8ov3Oik1HeJNNRbYI0HjH6RtA0qwYI/32yTkPnCmxOB2D
         +w/EHxNueDv7839Jlh2+hRvi/EkvWhZKe2tBKO1DcOwqgsQ6MgbJJznwANSv6CjdODso
         Bu4uBqQk4NF5NSR53FsTYk3YGVKwq+GYvfTrX4ZvhlCUnOODzTwvnEZnuX4WyMQko6Lr
         ITMw==
X-Forwarded-Encrypted: i=1; AL+hErFnY1YnxuVdO3EgI/hW6UrfBK0vbJvprn9X3LpdQ3G+IaRr41Jq+UHrqLnmGc4ZuknsRHVWqQ1a5WpK@lists.linux.dev
X-Gm-Message-State: APuU4Z8Ln5aHqlnyYZChauTgZPhM6RQzlx0n9YNBAhBgzZC7bYXCcq1f
	HdoNBV3yy21TnW+TBSNZ0nZ4V9ENPWM96VOvwt3Nzr2phV0/vWWWzjfnvThvfKh/HgJ5iEUld0X
	u9ijlu3ZF8owXn7rUu1QoAg4H3csWE+4ertHf5R8aQTtA3643ziMck0xNtU1URArMzjwgHLbP48
	tXYHu6C/hzAs+F/CUgglM29n0Om/lhjN7oYYjczzvCFN2ll7UleMJ0GJUX3pb3Vs+UQ44ZlSkDz
	Fp2StDIo8iREw==
X-Gm-Gg: AZFdTZdOQuGDC9Ski2CmKW1W9j1dIg+EkoI697IjRJc+lcVGsM8sz+wKKMOeeU1kg9o
	jenW2boBnip55HDoThOLS7ybxx+8wEn7KyTz/QgA1XIzhecOy0pkaC6p55x2XhoPkpgmqZgle1M
	b9vm3RpToKiwFGympT//Aqz20U5aH5MwyEsOxR44t5X/An9ChXVIMjIN5IhhNUIKs4bjbPNnRCq
	p3jyHOkQbAIWynMKqcUmXbYUpyc0m2yr3KQ72Gqpc8Vw8qDR/vBeMFTlZTFcWycdKb85/oJnS4R
	7j1upPY7dG8XwHa+uCIjznuTuc9CQ56quXpUy+4DVIorLr+5gfrj1cpYiKYeN+Ak3FGJbaukpDU
	XwKS+6Wv+5C9r/wZLm7wegR4xebWHoa9k0zxlqLJbElKSOPeGKmL6pSyjFaU0HbqHkc7h86ZzdM
	kiltpVjkesnxiiHHZ8ZA1xSETTyRccIkJe
X-Received: by 2002:a17:90b:3943:b0:3a8:f70f:2437 with SMTP id 98e67ed59e1d1-3b3d07e0a06mr1531245a91.50.1794984019536;
        Tue, 17 Nov 2026 22:40:19 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3d4bf2056sm509401a91.3.2026.11.17.22.40.18
        for <linux-coco@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 22:40:19 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-92111028a03so11621636d6.0
        for <linux-coco@lists.linux.dev>; Tue, 17 Nov 2026 22:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794984018; x=1795588818; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BN2eMBIZKP4IgFzjpmqX87SaP1ERJDhlfNIPjHVFBk4=;
        b=MP2e6cbuURw0/H8VAHnc2lzxgJXyjNxomxM24FPn/NQWy4jxUh1WuMqBWidoRIal7v
         LFlUFYZys98+cmXsB0zM/ggiyjQPziGcSDzEnGI+ciUzHxIGKpOJ2Jc2kIwKvnCzue1t
         ELsZJurwcyLJV12o4GDshVrGq5RzSrc+5KmGw=
X-Forwarded-Encrypted: i=1; AL+hErEz1y2SVfUHffplW/mqlGb7JEdTbthqJrF/nY36DqjFEVIoB+XyR6jaymPKdKgL9RwCvmTMvugs9MJu@lists.linux.dev
X-Received: by 2002:a05:622a:346:b0:536:7b67:95f7 with SMTP id d75a77b69052e-55d5a7af113mr24847301cf.77.1794984017833;
        Tue, 17 Nov 2026 22:40:17 -0800 (PST)
X-Received: by 2002:a05:622a:346:b0:536:7b67:95f7 with SMTP id d75a77b69052e-55d5a7af113mr24847041cf.77.1794984017277;
        Tue, 17 Nov 2026 22:40:17 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d61cf3b56sm2078141cf.13.2026.11.17.22.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:40:16 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	x86@kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kiryl Shutsemau <kas@kernel.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v4 0/3] x86/vmware: Clean up the hypercall code
Date: Wed, 18 Nov 2026 01:40:10 -0500
Message-ID: <cover.1794206170.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Move VMware hypercall assembly out of vmware.h and select the
low-bandwidth backend with a static call, following Linus's request:
https://lore.kernel.org/all/CAHk-=wivx7pi+h+hGmvNFAJm6StQLiQ-b8DdsE5J=LMOWae8Ng@mail.gmail.com/

Patch 1 moves the high-bandwidth helpers out of line and removes the
redundant vmwgfx caller annotations. Patch 2 uses input and result
structures for the four low-bandwidth backends, selects the backend
during VMware platform setup, and removes the early dispatcher. Patch 3
retires the unused VMware feature bits.

The caller API is unchanged. The I/O-port backdoor remains the initial
target for early DMI probing. Modules use the exported high-bandwidth
helpers and static-call trampoline; the static-call key stays private.

This series replaces patch 1 of Alexey's v2:
https://lore.kernel.org/all/20260309235250.2611115-1-alexey.makhalov@broadcom.com/
Its panic logging patches and steal-time fix were reposted separately:
https://lore.kernel.org/r/cover.1794201807.git.zack.rusin@broadcom.com
https://lore.kernel.org/r/cover.1792471114.git.zack.rusin@broadcom.com

It is based on v7.4-rc2, which includes the i386 high-bandwidth fix
this series builds on: e0e022004bbe ("x86/vmware: Fix i386
high-bandwidth hypercall arguments").

Please route this through tip. As the vmwgfx maintainer, I agree that
its small annotation removal should go through tip with the assembly
move. DRM maintainers and dri-devel are copied. I'll make sure there are
no conflicts in that code while the trees merge.

And yes, this code is a bit like me, meaning it gets on everyone's nerves
and likely looks awkward in shorts, so we're just trying to make the best
out of what a politician would call a less-than-ideal situation.

Changes since v3:
- Forward TDX guests from the backdoor backend to the TDX backend,
  restoring the pre-series ULONG_MAX return on other hypervisors such
  as KVM instead of attempting port I/O (reported by Sashiko).
- Correct patch 2's description of the duplicated assembly.
- Rebase onto v7.4-rc2.

Changes since v2:
- Replace the ten-argument backend interface with input/result structures.
- Move the high-bandwidth assembly out of the header as well.
- Preserve all low-bandwidth outputs and the backend-specific %dx flags.
- Export the callable trampoline without exporting its key.
- Correct the ABI documentation and retire unused feature bits.
- Keep the backportable i386 fix in its separate posting.

v3:
https://lore.kernel.org/r/cover.1793685318.git.zack.rusin@broadcom.com

Alexey Makhalov (1):
  x86/vmware: Route low-bandwidth hypercalls through a static call

Zack Rusin (2):
  x86/vmware: Move high-bandwidth hypercalls out of line
  x86/cpufeatures: Remove unused VMware hypercall feature bits

 arch/x86/include/asm/cpufeatures.h  |   4 +-
 arch/x86/include/asm/vmware.h       | 371 +++++++++++-----------------
 arch/x86/kernel/cpu/vmware.c        | 307 ++++++++++++++++-------
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c |   3 -
 4 files changed, 359 insertions(+), 326 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
