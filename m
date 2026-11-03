Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793690152;
	b=GHaXoBCtbBmqohNV01k3QX+IaFHcmA3HvnIbrnqPEfo7gpUYz5xHySSFe0sF060FiPCy
	 kHyBLt+QgrMs9oEUJtGrz4zvhugwRkJF3HH/J4Ibk7I2CXYGBlmj1RcpN96Huwo/1mfvH
	 E9pQ24yNX+7hSuFOtlqeImCId6whsq9aQ107oLrIh9Agegjlp+Vc9G0Z6jLQ/3dODp4ll
	 o67hE9WndK3UompMv1EXCiBnUy3jpXHI9d/WpVX8br6o5v0q5nvppEOKt3v0yK4p2N9s6
	 1lSToUZWtayU2HHyZ5nc5+jIKnwfhNGZ+emdqAwVsspSIEbsloK5PyD3qnOGqZNFsyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793690152;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=j/Bcqh1Ir2ox5ZHSRD7plS8yIHsdPIl+LjTttxcCQ1U=;
	b=jSn8+KDjeFqm5JZESrS5chrfUn0yZcGuNKrHekQA+i3GmUJfyvj31WxSirsuBoECes0z
	 eqkyN5xuMU1l8Sak3C4WWV5RJYlFfAx/abA/KB1Q6MRw+jXWdrW5wzvL6oEoANnwYrawB
	 UuTeezOOmFageqRRzLKRWlY6VFGj7jtaIefZl+99fj0LwCcwptmubalAtUtPLyZHAso8x
	 dtNGrVHYSLfOC+RDdReHlubHohiuvHf02224Zqk9IkPLfDMnmQlL3LTQJcrgd8PlEab0n
	 5xJzUEuSOeDCPEl8lVOFKYlp0n2oAWENNfIpGGYJCOCrieMsbS7KcwbxDLz9c/eSbew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JFJhmgzw;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AF1606A32C
	for <linux-coco@lists.linux.dev>; Tue,  3 Nov 2026 07:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2AF1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JFJhmgzw
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so2999791a91.3
        for <linux-coco@lists.linux.dev>; Mon, 02 Nov 2026 23:15:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793690151; x=1794294951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j/Bcqh1Ir2ox5ZHSRD7plS8yIHsdPIl+LjTttxcCQ1U=;
        b=j3iTLOEKAXm+YXHCYg9GZPuZXZ+x7XAiNULWitVB2h7RtPqU7pD+GhVX9ckf4Zb8Ec
         tA8HRcSsgV0M20wRO3nhxC/YTREb4hOA0USaukS11PC5j+FJNrxtlA10LGG480ysi8/x
         pZRAtFzz4skFrb+EvUULMnQzrx/lmV2B70kxASHfucV2xGRkgTEvQVPGDX58hChevMZb
         BgS2vCFqkH/mp/IV2cKbKyGh8PSYVInam5w9AKVaFIXZdi/WNjYfUSf2MZLI13xbLGH7
         vf+BEWBiMPOlAxLfkny4grtI6HTvwbdVHTM7NOHoznbbdox7vL1dHKlRvK/sxvSM9bdB
         Lc4g==
X-Forwarded-Encrypted: i=1; AKwUvBzi+aGx4rWrSw5a/YMUGKMXRlNkEfr1tv13NmFZKdjTnQk+JlGUpewYIDOzK/EOes0lPLTlRMG84YCZ@lists.linux.dev
X-Gm-Message-State: APuU4Z/JiUixrGRjZWkvJpd7fxL7Dprn9H305lR8Lh0lJPXRogHdwano
	IAcqVQ7ALObINjR5j820OtqGxLUL2qBRwDELryJt4B9sw+ieBMnCPuSbWjgp8oQfcYZo7PZ7l2/
	rwu254rK2R45ig4RZiT2kfRG5lUW14NV6GC3cU7JXy7TZIT1Ea3i/gf4LEhuIAlkmcxFiPn57nQ
	eSmyylmzs8JO6alZEbc9ONtLyj9FPZylocFFbPlO+AT5/UPdRkMZk/sFeiz9gfgylGwu0DU6o2j
	sJs76bng55f4Q==
X-Gm-Gg: AYBFou3glXO1R73XB9DgiRt3T5nq9eghc2LUzfSJgn7qVAF0AFT1BjwYkqZtlxoTijg
	06Vk6FQuPz59C66CdmREHNn0keaIPRR20TTpzQdoj5Sv4EKVHXPObybwLymgvANqOKqGQTIGb29
	4W+YTzUEM8WNfInWWKs2y7fGQ4LE9vSgg+OLd1QwWfaZv1A+NbDxVwX9eUPuzyUlRFWpxEUS01g
	nt/qo2/mJAYJLKBxd+TCZAJw86J/LHomayibo1U85Hb6Hfqsr5dZh153A6eytG1C38mUDkwtCJq
	ELIp6a9PPjuBTYJa3sZXcXnHOb7L4qjkNjVLgns+ZG1Dsbl7IDgGK+OkXkEBZUcn28jf+nVj62n
	c6Ic5vVlZg7kiDOP9+Ts/sG5I80ehvG32sjN0Mo7fEbJe1sL/ljShcY6SYinqHC/BvilpvFv13/
	ZMlMYH9MVwH9cmOmZtNADlVBAMrgiZbScz
X-Received: by 2002:a17:90b:1c01:b0:3ac:9176:e81c with SMTP id 98e67ed59e1d1-3ae8982cc67mr11221203a91.46.1793690150077;
        Mon, 02 Nov 2026 23:15:50 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b07cab84edsm1233625a91.7.2026.11.02.23.15.44
        for <linux-coco@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Nov 2026 23:15:50 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2373e9b4so384506185a.1
        for <linux-coco@lists.linux.dev>; Mon, 02 Nov 2026 23:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793690144; x=1794294944; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j/Bcqh1Ir2ox5ZHSRD7plS8yIHsdPIl+LjTttxcCQ1U=;
        b=JFJhmgzw88BS0em4SvJjG60IPbCSu4vd9cKLf1LsE44d32YRIDml6E1N135r1jEGrI
         i8jfkqdp8Mhg+QDPTmH45Bs0EEQ7dj5d90vNJn8s4E8+O8i17bMWOrGSg4GbvyGCyNy8
         MRhzY3FKIyfDjl0yc14Aa4ZX2Jh00i80jQFfg=
X-Forwarded-Encrypted: i=1; AKwUvBzPujkWL7sMmQU9wXIY8UqYz2OCN7LN5FBFvSmHQBmGjd0xcRAAPv5nXVuqmoFHki9EDvP8g3JKIECn@lists.linux.dev
X-Received: by 2002:a05:620a:4044:b0:93f:3163:3e37 with SMTP id af79cd13be357-944216b1af2mr2136142885a.28.1793690144063;
        Mon, 02 Nov 2026 23:15:44 -0800 (PST)
X-Received: by 2002:a05:620a:4044:b0:93f:3163:3e37 with SMTP id af79cd13be357-944216b1af2mr2136140385a.28.1793690143503;
        Mon, 02 Nov 2026 23:15:43 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9442581b2d2sm1018334585a.15.2026.11.02.23.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:15:41 -0800 (PST)
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
Subject: [PATCH v3 0/3] x86/vmware: Clean up the hypercall code
Date: Tue,  3 Nov 2026 02:14:55 -0500
Message-ID: <cover.1793685318.git.zack.rusin@broadcom.com>
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

This v3 replaces patch 1 of Alexey's v2:
https://lore.kernel.org/all/20260309235250.2611115-1-alexey.makhalov@broadcom.com/
Its panic logging patches and steal-time fix were reposted separately:
https://lore.kernel.org/r/cover.1790014793.git.zack.rusin@broadcom.com
https://lore.kernel.org/r/20260929040256.543767-1-zack.rusin@broadcom.com

It is based on tip's x86/urgent branch, which has the i386
high-bandwidth fix this series builds on: e0e022004bbe ("x86/vmware:
Fix i386 high-bandwidth hypercall arguments").

Please route this through tip. As the vmwgfx maintainer, I agree that
its small annotation removal should go through tip with the assembly
move. DRM maintainers and dri-devel are copied. I'll make sure there are
no conflicts in that code while the trees merge.

And yes, this code is a bit like me, meaning it gets on everyone's nerves
and likely looks awkward in shorts, so we're just trying to make the best
out of what a politician would call a less-than-ideal situation.

Changes since v2:
- Replace the ten-argument backend interface with input/result structures.
- Move the high-bandwidth assembly out of the header as well.
- Preserve all low-bandwidth outputs and the backend-specific %dx flags.
- Export the callable trampoline without exporting its key.
- Correct the ABI documentation and retire unused feature bits.
- Keep the backportable i386 fix in its separate posting.

Alexey Makhalov (1):
  x86/vmware: Route low-bandwidth hypercalls through a static call

Zack Rusin (2):
  x86/vmware: Move high-bandwidth hypercalls out of line
  x86/cpufeatures: Remove unused VMware hypercall feature bits

 arch/x86/include/asm/cpufeatures.h  |   4 +-
 arch/x86/include/asm/vmware.h       | 371 +++++++++++-----------------
 arch/x86/kernel/cpu/vmware.c        | 299 +++++++++++++++-------
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c |   3 -
 4 files changed, 351 insertions(+), 326 deletions(-)


base-commit: e0e022004bbedc7caf1c18770980eb5372019189
