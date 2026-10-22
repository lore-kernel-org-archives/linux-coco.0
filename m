Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792702901;
	b=TBb+It3qEIXc249x7eKjb4Fs0jvr5Oj3i9habH9w2cAc7PVAfpYjU7ItqzXfAeS6zvBf
	 qUauTtEHsgYxNxqCaBvqZ+8B5dH4OdR617h4DqvhHeL4+uKbM7bOD53c7nr7ckAMHPbMN
	 3QMG1j50umeh90tPS+GnVhp9PB6K83IsI34kcPhCbImyWzHrZv9jTfeq+Zfn48aYwBI1g
	 3I60mVEPyrfzIPTQT+rEJ89MgOTu8XkJhIY/xCFJYUUpRQw/kGERmHRk3D/fJOkdTrra1
	 b6s7QLVJRq1fqJ5ollT7soQBGznXb6Jg4ZEqrHX+VcH03olcTnDww9T1e1DNeWZe+uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792702901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=7uJDCwCkysKuVFqnR+oL0K2mJJYjE4p2eqvTotGVZOQ=;
	b=c7rrvRnPcNw8ByPu72FNz/D9Yev20L2NcruUMDSPEaa2+jmd8u4BNeHSslibGtLsXsoZ
	 fRSEG4r/bJI8xkQpdV4g9vVU5t1gYZYbu63H4DwerqbqJnxAKWDCle+8wBGKEvdrq8RLq
	 bvC6elC/jmkLMZ9pyxWh5xY/z2W7ThJGY/4PO3O8tCa1grUCiZ0jymP2XWeoNcfxNSmBV
	 BwsFNx2CgH22p1SnPcXYP7iGuze46FdkccE1BTm7ETNTE2R1H2FF7YMDJ3dL53bPH1DuL
	 6hZ/zb+F/gYOu+9Rrtg2g+7jcVO5lEGVb/ooc4mhInF+hCMpkpK97NdFMM0qMOaYF4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=T2WeKOnb;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9A0606A321
	for <linux-coco@lists.linux.dev>; Thu, 22 Oct 2026 21:01:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B9A0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=T2WeKOnb
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-89e96c03cd0so193899b3a.1
        for <linux-coco@lists.linux.dev>; Thu, 22 Oct 2026 14:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792702901; x=1793307701; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7uJDCwCkysKuVFqnR+oL0K2mJJYjE4p2eqvTotGVZOQ=;
        b=T2WeKOnb6d1m1oHdhgH7OrHVEhYyV2B0n6KvV8oTmMObzRkUPdVRmrI5hUQbyG78XT
         lGoOb9lmi0gInjjhoKAITxU0PnH1XGpNLuM6fDHNwqDUqiN+shIQ01xRlIluC1szlp2Y
         3M0Nss/NhMjobZu7FHU/r6JA89VPvMCupEqK1+q0JGZ5vTJZ3/+Ex5rx/E+I7AOxvTFt
         GDHU3UCfCfdTXcBgke0+Hkt8RiCKT/X7nx0xA8rKpKkRFHP0sICCVyJMwlrszt/EXaFK
         eiS3Cuulv4eoLiNkDBBLYCPjc1/5tcLe4moMDxSrLqj5Jxi7fzNXB/COlVtAamfZcy4V
         GB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792702901; x=1793307701;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7uJDCwCkysKuVFqnR+oL0K2mJJYjE4p2eqvTotGVZOQ=;
        b=frVHoz3pyDAJhQfVMXZVWcDx+nZyMqCrEE6EXGrU9Y0aVQIC7JxP1rBw6SJKGm8pOs
         YXLdfnv0LeX6ewNyjJVsHTGWJ2B078RIrapMPdXxyNeojKymZbeigzr9OqRcuuC+foJX
         bSgqpHSJaW9lDwXJjQBRsib8zLzmF0oMrazu07BxOJ6QGSBcEcaQ5tuuQYIsQ1NunyOx
         4v78lV/ndxg8jFI8eBp24EjqLACpSnqP6VyNU/txE4yj2E3M+mc5U/ht/fByMU2AHX7E
         5cjSm6adrpbUkqgplIXjvCyJIRGFsC+NSuSzDWmBUIo37XYMx0crFZcpYanMuxEPncdi
         MCOA==
X-Forwarded-Encrypted: i=1; AKwUvBwJ72RYMQRSVoqmO9WExxPvcLX2K0fmzX5RmdoyWNnSyecw8AG2zBvpnILkKgAwJlvvwRE20J39PdLt@lists.linux.dev
X-Gm-Message-State: AFq9FYJtZKX4BDgjLo9g4oj0A8MNi6dTVC3uIDqeu+AMZUD0/PrBD4lc
	3w/Ra3XxUz09G7Nf0mP8d7T3P/u1BfZl3J1eVv+I5odSxvaOfNtXnuDFFnd4bseflZ2xzkxDjYz
	TE8WEkQ==
X-Received: from pfbii5.prod.google.com ([2002:a05:6a00:8c85:b0:8a0:4085:d831])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:174c:b0:878:34d7:699a
 with SMTP id d2e1a72fcca58-8a2c76598d3mr228889b3a.42.1792702900543; Thu, 22
 Oct 2026 14:01:40 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 Oct 2026 14:01:32 -0700
In-Reply-To: <20261022210134.612848-1-seanjc@google.com>
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261022210134.612848-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022210134.612848-2-seanjc@google.com>
Subject: [PATCH v2 1/3] x86/cpuid: Mark CPUID function 0x23 as being indexed
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, Binbin Wu <binbin.wu@linux.intel.com>, 
	Changyuan Lyu <changyuanl@google.com>, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Add function 0x23 to the set of CPUID functions that are indexed, as per
the SDM and the many sub-leafs defined in leaf_types.h.

Reported-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Closes: https://lore.kernel.org/all/213d614fe73e183a230c8f4e0c8fa1cc3d45df39.camel@intel.com
Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/cpuid/api.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
index 82eddfa2347b..25b22b173f2a 100644
--- a/arch/x86/include/asm/cpuid/api.h
+++ b/arch/x86/include/asm/cpuid/api.h
@@ -181,6 +181,7 @@ static __always_inline bool cpuid_function_is_indexed(u32 function)
 	case 0x1d:
 	case 0x1e:
 	case 0x1f:
+	case 0x23:
 	case 0x24:
 	case 0x8000001d:
 		return true;
-- 
2.56.0.257.gf7497c7d27-goog

