Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA513F6610
	for <linux-coco@lists.linux.dev>; Tue, 29 Sep 2026 05:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790661179; cv=none; b=J6/XQimT3ip7xde2d3YE5PvNwS2gMK9PgC2a1ekYJeZDNQlAia5ZC+QnPzlMtP0hwJ1vM7lwsp3A0cgRrXyxUwvHt346BGxmRQz7l3O7k6Sc8TbvuLh3748J44pEi7SjMM4a0Y29Pn5hOSKQhm0YZPrBB6vqeoF2Mpr7yrFuHd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790661179; c=relaxed/simple;
	bh=7e4sXeFJ3QQFNwKsifPZ++1Lx7HnmX4ToYVT7DdVoRI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=l6QRoUvzJTGAvAzuameoPYORKiQWw+0OPsd27CprkpaGNwHhizVEfKm1nlb/6U7brhePaLRen70bMeJ9YZdnnaV2kz7dsYS5ekBJJ2NENfz7C0pn0RHzPD5r0gx7liRzd+D3MVgPmbBTSH+cBX8ryxEUp0XU9KJfZe7AttKoR1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--shrutiss.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XAeqQRBF; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--shrutiss.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XAeqQRBF"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-881b91eac9eso1938470b3a.2
        for <linux-coco@lists.linux.dev>; Mon, 28 Sep 2026 22:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790661177; x=1791265977; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fd7XnyqI//p9q3JxaL37a85VvYx8Nu6XtCLQZOYJTA4=;
        b=XAeqQRBFz/4vyNWl7SZeypPIWm9+CLidEACbhaE1f96rarmgPswk3/ytp+NDEhdjh3
         XW+DvNaW5lBaOBaCXZdo/wZzJ2G040IDfVRRKINxGFYxTXlxod99zWKpB3p5J6fGEjwz
         I0ic3/VdalwClxBIG5ZyJBsDD0p7EV8BHdOnQjCbO03EdoySiRWmEiHNMEvJU4Wc2apK
         6XQ+JOVEoeE+WOKa/jls9MqDZ0QrSb42h5nbCT6SW9sgIYeHk01r8JR58DS5HTJWzArB
         izEbqoB8d51nTUI93zsL1XmQGc4nIw6Mg9BQ4T8WGxd8YNZZtbOpRqZxsgslb11EOyAa
         PLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790661177; x=1791265977;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fd7XnyqI//p9q3JxaL37a85VvYx8Nu6XtCLQZOYJTA4=;
        b=QQ2Gs7wEn2auV6ZaFmEyhA/Gd9eB9+9KkQ1bXU8Qkn7bJeVbiUw/K04rKA6gJy3/DZ
         YK0XH7ve5VMmhYcNRzyzwP4lE7Xrs2F2WWVTYFgzv3kHj9opYTZb+kt1qtTvMtG/tAUw
         0NYO3CWM2fPzyNt7W6ZNgDlilQl1xDdjOkXdKhKVJdre1dHw30/7CB2vCroWd+9KyUD2
         8zwa2Yr7ssQYyKcituWquqCN+ZTmsKk/dkA0OrHfsJENpWr1g/hm19LJBx7baf0B9y7y
         3qG3exRGn5OeO4BS9jfXTR0PbWA1GxR5e6zw5xho82nKY/w8JLwI/4DFs1C8lB0Q+DMa
         zu4Q==
X-Forwarded-Encrypted: i=1; AKwUvByYqOjSnDD8ZjPyj5QQookyPELS/jO+jlFpfahLuVG4l69nUn4l6cY0EXjV45Tx1mnqPPHTu6IElJB7@lists.linux.dev
X-Gm-Message-State: AFuF++nFAopYnyj3CK0tpU4INqJWhchHNmIYdVLWF4ZPSRCii1hM7a2+
	tOnp86+XjxtHZwF97VkOMWFTtuTFq43FbjFbmUq6AshyTiIkizk3UiBx/OPazPfubKQI2wnvXNQ
	iFscT1kY07rTcbg==
X-Received: from pfje18.prod.google.com ([2002:a05:6a00:d2:b0:880:eb99:bc26])
 (user=shrutiss job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:408e:b0:87d:f382:14af with SMTP id d2e1a72fcca58-87e9cc174b4mr12314938b3a.1.1790661177115;
 Mon, 28 Sep 2026 22:52:57 -0700 (PDT)
Date: Tue, 29 Sep 2026 05:52:55 +0000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929055255.1380202-1-shrutiss@google.com>
Subject: [PATCH] x86/apic/savic: Forward APIC_SPIV writes to the hypervisor
From: shrutiss@google.com
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>
Cc: "H . Peter Anvin" <hpa@zytor.com>, Kishon Vijay Abraham I <kvijayab@amd.com>, Tianyu Lan <tiala@microsoft.com>, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, kvm@vger.kernel.org, 
	stable@vger.kernel.org, jxgao@google.com
Content-Type: text/plain; charset="UTF-8"

From: Shruti <shrutiss@google.com>

For Secure AVIC (SAVIC) guests, the hypervisor (KVM) emulates the LAPIC
timer and LVT registers, while the guest's APIC backing page is kept in
encrypted guest-private memory that the hypervisor cannot read.

Currently, savic_write() updates APIC_SPIV (Spurious Interrupt Vector
Register) only in the guest's private APIC backing page without
notifying the hypervisor. Because the hypervisor never sees the guest
set the APIC Software Enable bit (APIC_SPIV_APIC_ENABLED) in APIC_SPIV,
it continues to treat the vCPU's Local APIC as software-disabled.

When the hypervisor sees a vCPU's APIC as software-disabled, it forcibly
masks all LVT writes (including APIC_LVTT for the local timer) and drops
timer and fixed interrupts for that vCPU. On SMP guests, where secondary
CPUs (APs) start with their emulated APIC reset to software-disabled,
this prevents APs from receiving local timer interrupts and leaves them
hung in idle (HLT) during boot.

Forward APIC_SPIV writes to the hypervisor via savic_ghcb_msr_write() in
addition to updating the guest's APIC backing page so the hypervisor's
APIC state stays in sync with the guest.

Fixes: c822f58a4fab ("x86/apic: Populate .read()/.write() callbacks of Secure AVIC driver")
Cc: stable@vger.kernel.org
Signed-off-by: Shruti <shrutiss@google.com>
---
 arch/x86/kernel/apic/x2apic_savic.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/apic/x2apic_savic.c b/arch/x86/kernel/apic/x2apic_savic.c
index dbc5678bc3b6..1ef4c5b6c494 100644
--- a/arch/x86/kernel/apic/x2apic_savic.c
+++ b/arch/x86/kernel/apic/x2apic_savic.c
@@ -214,7 +214,6 @@ static void savic_write(u32 reg, u32 data)
 		break;
 	case APIC_TASKPRI:
 	case APIC_EOI:
-	case APIC_SPIV:
 	case SAVIC_NMI_REQ:
 	case APIC_ESR:
 	case APIC_ECTRL:
@@ -223,6 +222,10 @@ static void savic_write(u32 reg, u32 data)
 	case APIC_EILVTn(0) ... APIC_EILVTn(3):
 		apic_set_reg(ap, reg, data);
 		break;
+	case APIC_SPIV:
+		savic_ghcb_msr_write(reg, data);
+		apic_set_reg(ap, reg, data);
+		break;
 	case APIC_ICR:
 		savic_icr_write(data, 0);
 		break;
-- 
2.55.0.1082.g2b9226bbc0-goog

