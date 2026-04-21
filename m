Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45863D16FD
	for <linux-coco@lists.linux.dev>; Tue, 21 Apr 2026 13:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776779578; cv=none; b=MijdEDBR0pk4kmgagBXP9cLVxuJTIwI6irPw8S8Svq2YCtfGQcERrjWg9hjng7KR9q8knt+tNusKoRN5ODHb28STSk/+rzgFtv1zky7vmV5nxOWjeSG+z3+2w2lHhPeIcbPqG4CKnRnmScyEcb88RCaTjCoWvTd9ue2hkOukOgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776779578; c=relaxed/simple;
	bh=r+WwHEnqkbBMU0GIdnMgG7lQPhDE+bh/j2FW8OmYQ3w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rnq0EPtAWchJy1lguZpep39UP4qkEc/zEzCrR2QmYCarOihp973o2XYsn+go35eZHcIYOauUGwV/mhSUBQu9LDvzahkj6xczgByx7dUYxFG6XuZ7i6Qq6H9VB8RXAED/BvkFH+/A8LTYUcoR/iM+238/mv076m7m83kTmhOHa6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hh8OJUln; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hh8OJUln"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35d90833cacso2692760a91.2
        for <linux-coco@lists.linux.dev>; Tue, 21 Apr 2026 06:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776779576; x=1777384376; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0u/vOf9MRjGdS+aUvxA7BuDlL6EoYtTCq2GhHcWAQUc=;
        b=Hh8OJUlncajlgb+Kvade+gdZsK1nJgQVi1FBBC0VCGPW6Wrs3hcHS+rMD0djkidtnu
         Y+HX0qabwU3wUdnUNmSZCPt1eF2S1UXdM6fsMr//6guw5/ZCuyIEKwprHpq3gQwvtA1k
         Vs4cQ+GbuQukMoCEV49GHK1PPEWlng9HYoihTuF+3nmb7mlsXxQqQFPzFs/VE8jR9gas
         q9ugyHz1aUOMM38quS7MfrcPLGe65Bni4TzwQ4TzAD/xt88uhGfVTOE2Mk85wHz6pUdx
         jpRShJDsEvEka0YMJM37jAjm8rYoaQ9ZzK5jijZnXoGTT0jySB/J+xmMMpJDBMBr6Gjv
         xppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776779576; x=1777384376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0u/vOf9MRjGdS+aUvxA7BuDlL6EoYtTCq2GhHcWAQUc=;
        b=mPhYzVDOUBi3v917rYWJmmYJKUCgibXBibhnbHsMNCjf1vY42JWDmd1tOhFJ7RGEpd
         G+AT6vEjvAR2lnXYH+Y6bH0/mzFJ0PmlFeLWGzpVCxTrORnc7f8wmdYWSCedUU3VwpLK
         6hK2zanxRcYfG7Ze0zNRXI0eHpZQ4+3BOwrKCWLv6HUoHZ8Vo969QrOCxaACyKDyM/k6
         e2FunNyL11yJG1VIZeNBlrbmrAM0/lag/0BCXFyVNpM+BAl5d2OrI5YpAZY2gtBUjHFw
         yyhXjFycUe9u0Umint7vrgnUwNyH80hB3TcKyS1Z8fxeVz5KE0158ARes+8DpCw2n303
         I2dA==
X-Forwarded-Encrypted: i=1; AFNElJ8Nh5NoFrYNue58FpnKvK/FBLdxp5dSTW7wTorCa8OI+qa0nfkYqOiGzWWQvolLWhc9TkpFWQR9+BfN@lists.linux.dev
X-Gm-Message-State: AOJu0YxYAvXEakLmoGmAFRnXfBZ9eMl8iaMWnSTlp3a2nXYRpl3u5yeu
	BFGEuQN6UITQkq5/w+APynryXOvI3m+QgmEtutu2IRDPQ34S/EaLxkr+
X-Gm-Gg: AeBDietv1nqfjXAiyE5Fy2ZcDzMkJtGfORfgolZL1BpD4GX83tV2q7OROw5g+QN7woi
	RHlYtPahFxnDJnnEDTcbbdyPQBd8ASzDbWGYUKhMIpXrMK7QtWopXDlLvJZi5ojgjxCiJc+ESJv
	JCgokeUklSR7/f9lNcgoJwV+4AKpJ86RvG/1oNESIUMY/+DfTNS2BE8vdLDL78cO6lBZpNg1Qwb
	3nhkbR2ihA8w3Ip6TrnYsc2APOQvv2CmPiHvBNPOvw+QB5ewaPI74IAqapblcND7hpytQeHSlEm
	j5SQeaN8Acq6IzdnW3QGf5EzkzOCNZR30Gy4S4AxJnEhj15ixVK06U6aPqRik103uafX0nHYKeU
	Okh56GmBMSOToJuKjCzWaZAEDlqFrGyir6buzQrkL7XW+ehnXUPxC4s5tiX/yT5YAO6YV9gghZL
	QVtC0s63q8fVieEVw4LSIIrn4KcPu8ZYQXqNwnTqFL34iGfZPGJ0YB6Do=
X-Received: by 2002:a17:90a:f16:b0:361:4521:d311 with SMTP id 98e67ed59e1d1-36145221bbfmr11784735a91.18.1776779576240;
        Tue, 21 Apr 2026 06:52:56 -0700 (PDT)
Received: from BF-202508301248.localdomain ([39.144.124.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa33486sm165571555ad.33.2026.04.21.06.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 06:52:55 -0700 (PDT)
From: Jiahao zheng <jahao.zheng@gmail.com>
To: steven.price@arm.com
Cc: alexandru.elisei@arm.com,
	alpergun@google.com,
	aneesh.kumar@kernel.org,
	catalin.marinas@arm.com,
	christoffer.dall@arm.com,
	fj0570is@fujitsu.com,
	gankulkarni@os.amperecomputing.com,
	gshan@redhat.com,
	james.morse@arm.com,
	joey.gouly@arm.com,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	sdonthineni@nvidia.com,
	suzuki.poulose@arm.com,
	tabba@google.com,
	vannapurve@google.com,
	will@kernel.org,
	yuzenghui@huawei.com
Subject: [PATCH v13 00/48] arm64: Support for Arm CCA in KVM
Date: Tue, 21 Apr 2026 21:51:45 +0800
Message-Id: <20260421135145.14789-1-jahao.zheng@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318155413.793430-1-steven.price@arm.com>
References: <20260318155413.793430-1-steven.price@arm.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Steven,

I've been testing CCA patch series and noticed Realm VM cannot boot successfully when the host is forced to run in nVHE mode (e.g., via `kvm-arm.mode=nvhe`). The kvmtool debug information will be truncated in set_guest_bank_private_gpa. 

Currently, in `kvm_ioctl_vcpu_run()`, running a Realm VM (REC) bypasses the standard nVHE EL2 stub. `kvm_rec_enter()` directly executes the SMC instruction to transition to the RMM. Upon returning to the EL1 host, the code falls back to `kvm_vgic_sync_hwstate()`, where the VGIC save operation is explicitly skipped for nVHE. Since the EL2 stub was bypassed, `__vgic_v3_save_state()` is never executed, and `ICH_*_EL2` states are lost.

To resolve this, I have a couple of thoughts:
1. If Host nVHE mode is not intended to be supported for Realms:
Since RME implies ARMv9 which mandates VHE, running a Realm with an nVHE host might just be an unsupported edge case. If so, we should explicitly reject RME initialization or REC creation when `!is_kernel_in_hyp_mode()`. This would cleanly prevent the undefined behavior.
2. If Host nVHE mode is intended to be supported:
Since RMM should remain agnostic to the Non-Secure VGIC states, the burden of saving these states falls strictly on KVM. However, the EL1 host cannot access `ICH_*_EL2`. Therefore, KVM needs to add specific logic for this scenario. We would likely need to route the REC exit through a dedicated nVHE EL2 stub to invoke `__vgic_v3_save_state()` before dropping back to EL1, rather than jumping straight back to `kvm_ioctl_vcpu_run()`.

I might have missed some documentation or comments regarding nVHE restrictions for CCA. If this is an oversight, it would be great to see a check added in the next iteration of the series.


Thanks,
Zheng
