Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70851347BC3
	for <linux-coco@lists.linux.dev>; Wed, 12 Nov 2025 17:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762969193; cv=none; b=uLYfHqpvcP9yzJn8gHq6ESZEjTDzVN/YOrkMmVkd3H6dXmDgD/CKiZzejiZpvXv4bJvtpBNJtDGiDOyEoC3tYlSMyKQQGYpDsfesWVUovy4XPGyGLK1COC7bVYAVR2Bm5hkV8uCb3d2iPLR9CvOwpSc32iqNc+o9+MhZQsAz4RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762969193; c=relaxed/simple;
	bh=WiNWbvfwoo+8EdAa9Uz8Q0T/2sNuMxxs4D8jJ5u/WA8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eczAZet6TpXUOuQKFlNJdaboOzSBSvInA7talFuBlAFuCOFM6lZz3yy5vX7dcaL+VuJrJcK+oAWNft5zeM7K3kwEOvixE5rWHWArRLjMA7m2gkk+JS6lGIYTnmfN5XUaLnH4JSFC9D65dV3sx+B2kuSIiTztbXizQvuPtdu3oAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MbAnIi6E; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MbAnIi6E"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7ad1e8ab328so885710b3a.0
        for <linux-coco@lists.linux.dev>; Wed, 12 Nov 2025 09:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762969190; x=1763573990; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=3jB11KRi3IX+N8TsZocIARdIpUY/Xl/OcZwePjrIV+8=;
        b=MbAnIi6Er1BvNncOsBrC6RfIGz3a7ZH7R0MXEC3xy7JFblon8I9AaAY6LXQhco6IWl
         40k7QB0dYa0du5UEkHipc0yvXpr4zQc16PiYy7+K7Lty1wTJKw6QS1qDdHePAP2w3ufb
         usN/jwCGeVgSeR0URaonqjMDpB2NzSTudc1ybunRui0XIok7O/3XjQQV6r0aRuRjBENf
         Ve/hKUCdBIufDB+khoCwa4YGIlounGgaRbOss6u6ghd7F3iHQbFmhT7osRfrLYojn13D
         R9tuAi/XvNEEyZz7DY/H0jgkzIYRJoC7FnHijOOhTe4FX87BWSP5JGP4luBE+Jv6ZFna
         k1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762969190; x=1763573990;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3jB11KRi3IX+N8TsZocIARdIpUY/Xl/OcZwePjrIV+8=;
        b=PWK2AZJGDGao+r6wZVWQxCbF/m294SBFrIuJEsLU8g9xnAUDetpIaYk7ELAkxArV1g
         jqzT7kE/wvnBi2IP+ealG9ZqGtWpDtrvnobN/8hXF8jKVu7Tnh8vlra04wp7gsxOP9py
         O27c3AmVobwBzqvAs5MmfJyLDK55TzUJ/nOxxW/DmWPXhTHTkKPqUSLvnc+Ap3thi/I9
         EKRoYKd1W21XofeRQZ6rtHRHxVqUO0xIbVP4ym39c2CIvVPZjWTK1/8O/UJDjKN5IlxZ
         N66OxerHrtxFmC4b3NiTt2jQLwovEQ9D9sgLXOVQKcngKowICpXv66dmBBw1tTN8jGyP
         6r5Q==
X-Forwarded-Encrypted: i=1; AJvYcCX4QY08H79dR22OEYPOkv3m3UobTwat0NcI5AwswRg+TfcXB6b1Y+wI//8pJUAyLTaCd8iYwTgeCTrU@lists.linux.dev
X-Gm-Message-State: AOJu0Yyc9zPMQ+unO0+rfhqKZHMiEimBBW7OoBf5uI+Ko33JTU4BVXao
	IhW51yZl5BHy1gljYZquPrqfg7z1n7RFvfT+6zK8YZp/vCJLMIrYF06qCN5GXz19j2xjo5AlHaX
	34ZFFlw==
X-Google-Smtp-Source: AGHT+IEzUdshi4KJh5WFIAXko+n+YEgi4OqqdjsC4s4GZ3jRZGaScEAL16+P4T3e1ewsgL1T8TGXhgEoctI=
X-Received: from pge1.prod.google.com ([2002:a05:6a02:2d01:b0:bac:6acd:817e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:4305:b0:343:9397:c4d5
 with SMTP id adf61e73a8af0-3590908eb63mr5330693637.12.1762969190457; Wed, 12
 Nov 2025 09:39:50 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 12 Nov 2025 09:39:42 -0800
In-Reply-To: <20251112173944.1380633-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251112173944.1380633-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251112173944.1380633-3-seanjc@google.com>
Subject: [PATCH 2/4] x86/mtrr: Drop unnecessary export of "mtrr_state"
From: Sean Christopherson <seanjc@google.com>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jarkko Sakkinen <jarkko@kernel.org>, 
	"Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	kvm@vger.kernel.org, linux-sgx@vger.kernel.org, linux-coco@lists.linux.dev, 
	Kai Huang <kai.huang@intel.com>
Content-Type: text/plain; charset="UTF-8"

Don't export "mtrr_state" as usage is limited to arch/x86/kernel/cpu/mtrr
(and nothing outside of that directory even includes the local mtrr.h).

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/cpu/mtrr/generic.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/mtrr/generic.c b/arch/x86/kernel/cpu/mtrr/generic.c
index 8c18327eb10b..0863733858dc 100644
--- a/arch/x86/kernel/cpu/mtrr/generic.c
+++ b/arch/x86/kernel/cpu/mtrr/generic.c
@@ -89,7 +89,6 @@ static int mtrr_state_set;
 u64 mtrr_tom2;
 
 struct mtrr_state_type mtrr_state;
-EXPORT_SYMBOL_GPL(mtrr_state);
 
 /* Reserved bits in the high portion of the MTRRphysBaseN MSR. */
 u32 phys_hi_rsvd;
-- 
2.51.2.1041.gc1ab5b90ca-goog

