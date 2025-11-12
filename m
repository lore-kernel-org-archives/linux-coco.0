Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AAB34A796
	for <linux-coco@lists.linux.dev>; Wed, 12 Nov 2025 17:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762969195; cv=none; b=J+d1NBW1J9MhoSEafVPmBtguqj/05e1/FAfHTpTrjeN3fn+eCUHCxML7qkUjGTDW6lf5Mecr9OBZVawsZOK9v3AwwYAexRfKj1waHNgeHoNrmdCMR9zlNcV40bcA91o2MeKk+5duy+cCdSyTuEGvx4InhidAhYtCSmxnNLbt3TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762969195; c=relaxed/simple;
	bh=lbv7KBOnId+FabH1167dMbnJJpBWntZ2AQurHl0Ymh4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bAsW8ahB0Dbm/C+/Gv4ovqDC+b5AHotMwO56qpi/qwqWnIvCxbDqv+GFzRp9OYXaDuQk3IgeawT03AQ07RGsoEGiFpjbPuu+5COytZh0ANmt+G3BSRgM/kGOXU21K5YazBjWx8gWqQJ1XddWDmnUc/fEQfLwjvSmmVBg3eKUzQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fz2lXgrT; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fz2lXgrT"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b5edecdf94eso2134598a12.2
        for <linux-coco@lists.linux.dev>; Wed, 12 Nov 2025 09:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762969192; x=1763573992; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=5TnDpCtdkW5EjfNm/WK8+BC1Q5HsHLmqdVi4Osqi6cA=;
        b=Fz2lXgrTerlRBoPAcUZxuj9ALod6xlePpDbQgXmD1SO1zHzqKGM0K//wvQ2awYRzXe
         xBiVgQWT4QIGhphkJ5ZmVZdomYxSN79uTZD+OBedOZIhPXzMFmkBX191iaMT+y5/Scew
         jk93rdctRUiC7PjdsuGpsJ6ivn3fvqSNeTOGM+NwSWuUpL5QJUMlb0HpLTsdYmn33OVe
         Nk6033B82zS8N6ty4wFZrRZ/4d+mkxFjRPvbvYXBjVgQOqNwtKgDgpqQlxvq43pFI7hG
         1xnUeczCk1C/HXU0XP4huVWCxjhGekwTKXhQQh+AJeg6yXhSEDYapQSS87ltAeUfOwHT
         46LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762969192; x=1763573992;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5TnDpCtdkW5EjfNm/WK8+BC1Q5HsHLmqdVi4Osqi6cA=;
        b=amcH9Zsl5Vbky4IPQkepA2vCyzhVEfGIPM9kImstZifcBpISr7yjcF5jqZ6Dx7uPd7
         I3xGvSwwC+SfyL+z69x/zKu8W4T9SpyXXlwXCcdOajw2uNTDyVK/waTX+YsWeklFKGVd
         MNgAqBsF71sJgsbZaolsvU/F0yAm6ON3MpmDs/WgsmrnZ+e0mUdd7ofyFEmKi/N2LBvT
         zoN5+aH88h2lvmALJxAOJ7GqTQIMj6OVPC419qSmHXoPjiS/npJXQluSw3g2ZovXjc4y
         mcl8+Mfqb7nSN9qqbQe4HB5gzch3Mp856P3ZN+zOuxp1lu57oVGGXMevNuMlLN27+Ys1
         +T1w==
X-Forwarded-Encrypted: i=1; AJvYcCU83Giob2Vklod1O/GmgDPPIJnsV3a73bJpD+OoFR0zNjmOlsp+8lRVbItrKu/KS8oBOb8miPAMDT6h@lists.linux.dev
X-Gm-Message-State: AOJu0YzTRaH8Do2BiMFuNYd436HBaDkQB2HtnACtKIq4qQVTjazky07h
	4E5YPoQZopaM8KLW8zwKYYz16iIg62mCzvXKlDJRqFObqM37Sdrv5mSryUquo8HskWbUNjb8pAx
	lClgBIQ==
X-Google-Smtp-Source: AGHT+IHz/l05PZRgfyqRId2a6PpuZL13C+FOannHS5GzYwvPYmTtNXM3YC7Qpo5B6cCtNaEfJoKUfU9w7hc=
X-Received: from pjbeu11.prod.google.com ([2002:a17:90a:f94b:b0:338:3e6b:b835])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a91:b0:341:761c:3330
 with SMTP id 98e67ed59e1d1-343dde8addfmr4774092a91.23.1762969192338; Wed, 12
 Nov 2025 09:39:52 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 12 Nov 2025 09:39:43 -0800
In-Reply-To: <20251112173944.1380633-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251112173944.1380633-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251112173944.1380633-4-seanjc@google.com>
Subject: [PATCH 3/4] x86/mm: Drop unnecessary export of "ptdump_walk_pgd_level_debugfs"
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

Don't export "ptdump_walk_pgd_level_debugfs" as its sole user is
arch/x86/mm/debug_pagetables.c, which can't be built as a module.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/mm/dump_pagetables.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/mm/dump_pagetables.c b/arch/x86/mm/dump_pagetables.c
index a4700ef6eb64..2afa7a23340e 100644
--- a/arch/x86/mm/dump_pagetables.c
+++ b/arch/x86/mm/dump_pagetables.c
@@ -486,7 +486,6 @@ void ptdump_walk_pgd_level_debugfs(struct seq_file *m, struct mm_struct *mm,
 #endif
 	ptdump_walk_pgd_level_core(m, mm, pgd, false, false);
 }
-EXPORT_SYMBOL_GPL(ptdump_walk_pgd_level_debugfs);
 
 void ptdump_walk_user_pgd_level_checkwx(void)
 {
-- 
2.51.2.1041.gc1ab5b90ca-goog

