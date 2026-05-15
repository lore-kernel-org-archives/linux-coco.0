Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FC03F99EA
	for <linux-coco@lists.linux.dev>; Fri, 15 May 2026 19:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778872857; cv=none; b=rAScjGDMlfqCS3Lfo03ik/TLf4u6ahzaIQ/wcKjS35rO/20EcidAgTWfSH5fAQEO5pW6CwTqJwoFHBAXwVPH4rYZlKHZSuZEtZqMUdKlQTMun9ebkB9lVWcGIChfNJ4eRa6G4wQmZxXsl7dltNIR/5/SjcVH3J7jz/TC0df544k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778872857; c=relaxed/simple;
	bh=lbZq5HMMUdoKD8t+V1QOxdv8UCq5RsQl+bpxwZwTljc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VOc/UcQl4xDkTQ33wJtrPOGdaGDqfBgpjmjXCL5sMTJDoeoiQ8zp/SRLPtmAl1zVbi9SDe5UYR3uqTlWpa7QINYqaM2VPGpufAUSARB7kgLw6E30zYhCwNMtVPHQSQbffoY0JG0wQBmONS0P9VxWh4PYTZNw6afyggOYnt5wFJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qVg4AZzC; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qVg4AZzC"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-8353b042152so237589b3a.3
        for <linux-coco@lists.linux.dev>; Fri, 15 May 2026 12:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778872855; x=1779477655; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=BtD3/8r1rxxPL0bRTCD1R2r93qIzEoWuEeKvRfTm7KE=;
        b=qVg4AZzCKwvLSp8hSMdbR/HMWueCRkMUCN/uMXs33Q3yu5f6HwLXxOdznqW1gtv7s/
         fKG/C5zT4I0L8Ve+s7AF5T8mjvXz8AjMJt4XgLR86zj/SOkg7uAZg3r5MUr1/O5KBbUe
         26HAMLOUcrEEz576BNmQ8lFPyAAZnOoHnPEUTIUyypV4orOa0HbSD64Ak2a+aRXU8DhL
         o+vfWSCIhIOyZPQTfNmW+iYy0XXJrc1ek7SZi3w6/xPePrQDAZWcCJpyCsfbqmOFpi1H
         F4JlymwbZLPwI+onhkJwHr6GwQej6+dSeGeMlEhfCfbbfbLQt1IxqmF3Wd1d40z+xQZ8
         nVeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778872855; x=1779477655;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BtD3/8r1rxxPL0bRTCD1R2r93qIzEoWuEeKvRfTm7KE=;
        b=rDfzoRBykvjsnXXoIWSA/Ggb0Qft13JSX4GCOPXF0dVUajC4W6NiGDAV24UVm6SakI
         2JUg2knO2ELyQY+0e2ccQpDjDXtrF9Ati6jnTAlvyvzPhowZr60JkeHfvi+pns0u0YMu
         M+cQzFib5J9XqNT9s5BkyWe7CGcg4ENGlIdYi7f3XSSSJD3x0lS1eDZMmnzTphQtHz0D
         bQlv8G9FimUqstU1x/nDuXStv/UueMMlS4O1YTGql6kTT6JdtoX5blasbyJEYV0d8WjL
         Tz0rcy6qKWJ8mMFTaKXU1JvyXyrrbJ+MHWiCmRM/Q8fVQSEU1Ds08KM9tcx80vWEJp0Y
         uGRw==
X-Forwarded-Encrypted: i=1; AFNElJ8DQZCKvxYDnhr1o3mqKZSx0T46od0HfC/De54zeY/QSK78U1O4Z0mr6ccTo3/2p9PQbgwV9n8bSy7W@lists.linux.dev
X-Gm-Message-State: AOJu0YxBXG4LO5jBb33rHztrKQW7tsjjdvpHYWIhC8gdbvUCS5bAhYAi
	iAbagpqv+XN1r/u77X/Y/HGpY3pux2/FQkJSIDbb7kSDgH0NbwTvWHYGTrhm+Wr2Z0sp367sUvE
	G5Nuj8g==
X-Received: from pfbly26.prod.google.com ([2002:a05:6a00:759a:b0:82f:a4cc:2fb3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:ac86:b0:82a:805a:7e2
 with SMTP id d2e1a72fcca58-83f33c4ed90mr5838917b3a.9.1778872854522; Fri, 15
 May 2026 12:20:54 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 May 2026 12:19:23 -0700
In-Reply-To: <20260515191942.1892718-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260515191942.1892718-23-seanjc@google.com>
Subject: [PATCH v3 22/41] x86/pvclock: WARN if pvclock's valid_flags are overwritten
From: Sean Christopherson <seanjc@google.com>
To: Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	John Stultz <jstultz@google.com>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, x86@kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Michael Kelley <mhklinux@outlook.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="UTF-8"

WARN if the common PV clock valid_flags are overwritten; all PV clocks
expect that they are the one and only PV clock, i.e. don't guard against
another PV clock having modified the flags.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/pvclock.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kernel/pvclock.c b/arch/x86/kernel/pvclock.c
index a51adce67f92..8d098841a225 100644
--- a/arch/x86/kernel/pvclock.c
+++ b/arch/x86/kernel/pvclock.c
@@ -21,6 +21,7 @@ static struct pvclock_vsyscall_time_info *pvti_cpu0_va __ro_after_init;
 
 void __init pvclock_set_flags(u8 flags)
 {
+	WARN_ON(valid_flags);
 	valid_flags = flags;
 }
 
-- 
2.54.0.563.g4f69b47b94-goog

