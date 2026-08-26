Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6573BBFAC
	for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 09:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787735892; cv=none; b=dEGOAWDkkNzWpkywDNzSQ6eJ+sUjsNzyRIhrA6ZGOwEiBP2JNNZrxh2juMnvI1WdFoHMG0X6WiA56bQVbdLSRt2r9tVWzetKNBR065GLwifE5mOHxkp+lMU8IOBRFepLYlB+1yTTTVkQfZsULUQi7rd07Mc/asdFKZijkoZrba0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787735892; c=relaxed/simple;
	bh=D4ST30jQRX/uRvFqP97izkZ1CblAEsOFPjcrOf14KgA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=W3BhFcQRBkHDWqPLnIQ4yjMNHT92pzdZZnAt6Wo+kCX9/yYvNHQ3OqUoFjACx9mGVx1/YC5I71hirauLii5e6jOHMmNQt6fnhR3Z/1qxAIgJ8E6m5D98xmLH07eNvOY4ANnAP2PVxYbAFWWATc6Ar5U0IfAFXHqnTW5Q/Oh2FgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HpcnNr8N; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HpcnNr8N"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d04908139bso12122105ad.2
        for <linux-coco@lists.linux.dev>; Wed, 26 Aug 2026 02:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787735889; x=1788340689; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JT2WmuQLq+zfNeKl7/c56AfNeqFR+S/et95W/1dj6Uo=;
        b=HpcnNr8N8RaE6vr+FmJVGhl1JBPXuAAJHI9tiZrP5JLjC5nkXZfofYYA8QBfdVYXsE
         EXtuqnfulkiyKW7eBhTqCDgNO9CBPERE3UOJZl9NdZbkCn024qu+VQ8zjiyJdbhKKMkn
         Ygf6mjj/kzO5c5xKPXpePc3o7hrT2/sjf7bRWhOEKhBUSbgB1pKjy8frDaNtCBxbftRv
         CGksT0Pe8stqw7iNJj6iPsTottb14UMvuydb9CBjIInzYIcLiu32MujmTLjepAY1edez
         YM9h3yCAejCSBULGvl4Z69GZvIe2AD3e1/QLhKVo7aekIl2Wzvj1N2W7m0uksUeZZS8b
         KRlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787735889; x=1788340689;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JT2WmuQLq+zfNeKl7/c56AfNeqFR+S/et95W/1dj6Uo=;
        b=YHNg8cf/OLt2kF9JhspszeqCKkih+wJkYcbkp/uQJcuVJ5yiDaGLeM/MRjysFvJJtS
         dGY5TcfElV3m/vOz6eQLKETfkggKjc0PeLPoe3NQgctdYNbW0G+5os3o9fB4povlGC3N
         amZPoYD9xU15hzbPk2jkJvg+WmwewmvwhVcox2K8zqtVdhr1Ccj6jqgWgn6kRtauMJBy
         2shummuP130cHILm32HJmcDhCn5G3HZeFNxd+VFkUD6PgrgBjH2hz7yRmXB79JoQJKmJ
         CcvzHRYbxYUQCih3ZLKh2lEdR4DWYhwPDh2GHaBn3VGCVxXoNFVTi2eb3C6XWFWBKpcV
         hxww==
X-Forwarded-Encrypted: i=1; AHgh+Ro+edc63tZK3DonEwD6Rkj1aQXbuScLnJXwLnNYO+suToNXnW5zdCHycQZ8exNFkaWmExehDrDsmmVp@lists.linux.dev
X-Gm-Message-State: AFuF++lI82f2YY6MYexs1yytWPtoUnFcVMqfnbOpq5ggMRd7UVZBrIyf
	s1eV5IOJcRxZQ5R1gEl1QRyYKWf5fPohe12ZZgIRuAsoLHc3653hjkLMSQ4j1q6wQ51j9cyeHdQ
	STp1qatnJm8ZR8fTDVrX0gO4d+Q==
X-Received: from plcq19.prod.google.com ([2002:a17:902:e313:b0:2cb:97da:d8ed])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e550:b0:2ca:1479:d9dc with SMTP id d9443c01a7336-2d707b64aecmr84939595ad.12.1787735888790;
 Wed, 26 Aug 2026 02:18:08 -0700 (PDT)
Date: Wed, 26 Aug 2026 09:17:59 +0000
In-Reply-To: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260826-gmem-inplace-conversion-v11-0-0a15d8a799aa@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787735885; l=3210;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=MbWJTengbpxG0xzwuz0lf3xMYAKXqHxm3CvrNeYe0yg=; b=hid3XaxmgWKMsVpycO2R5BnX6MEajs6GC6HPVzfM1VFvQ2hq+z9XIlxbkBtBsD30MHilmtY3L
 IRzNTIuPyMqBQVP+ooVX/F9ukdcP/AjeJNSyeQCltEtrfkmjmdgb3Nr
X-Mailer: b4 0.16.0
Message-ID: <20260826-gmem-inplace-conversion-v11-1-0a15d8a799aa@google.com>
Subject: [PATCH v11 01/46] KVM: guest_memfd: Optimize away conversion
 overheads via dead-code elimination
From: Ackerley Tng <ackerleytng@google.com>
To: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Fuad Tabba <fuad.tabba@linux.dev>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="utf-8"

From: Sean Christopherson <seanjc@google.com>

Add and use kvm_arch_has_gmem_convert() to guard guest_memfd's invocation
of arch hooks related to converting memory between private and shared, as
only one half of the x86 CoCo duo needs the runtime hooks (any pre-work is
pure overhead for TDX).  At this exact moment, the overhead is negligible,
but that will change when in-place conversion comes along, at which point
to-shared conversions will "need" to find all affected folios prior to
calling into arch code.  In quotes because very technically that work could
be pushed to arch code, but that would bleed guest_memfd details into arch
code and would be far worse than adding yet another kvm_arch_has... hook.

Opportunistically provide the kvm_arch_gmem_make_private() declaration, and
rely on dead-code elimination to eliminate the call to non-existent code
when CONFIG_HAVE_KVM_ARCH_GMEM_CONVERT=n.

Reported-by: Binbin Wu <binbin.wu@linux.intel.com>
Closes: https://lore.kernel.org/all/1ec08cd8-3072-4753-ad5e-cd34956647f8@linux.intel.com
Suggested-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 arch/x86/include/asm/kvm_host.h | 3 +++
 include/linux/kvm_host.h        | 3 ++-
 virt/kvm/guest_memfd.c          | 5 ++---
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 683bb8bf43a94..6beddd8a0c749 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1854,6 +1854,9 @@ enum kvm_intr_type {
 #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
 #define kvm_arch_has_private_mem(kvm) ((kvm)->arch.has_private_mem)
 #endif
+#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_CONVERT
+#define kvm_arch_has_gmem_convert() (!!kvm_x86_ops.gmem_make_private)
+#endif
 
 #define kvm_arch_has_readonly_mem(kvm) (!(kvm)->arch.has_protected_state)
 
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 502465119ca0c..b7516e19ef419 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2597,9 +2597,10 @@ static inline int kvm_gmem_get_pfn(struct kvm *kvm,
 }
 #endif /* CONFIG_KVM_GUEST_MEMFD */
 
-#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_CONVERT
 int kvm_arch_gmem_make_private(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
 			       kvm_pfn_t nr_pages);
+#ifndef CONFIG_HAVE_KVM_ARCH_GMEM_CONVERT
+#define kvm_arch_has_gmem_convert() false
 #endif
 
 #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_POPULATE
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 589762140c3ef..8f8e5b6b70134 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -772,11 +772,10 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
 		folio_mark_uptodate(folio);
 	}
 
-#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_CONVERT
-	if (kvm_gmem_is_private_mem(file_inode(file), index))
+	if (kvm_arch_has_gmem_convert() &&
+	    kvm_gmem_is_private_mem(file_inode(file), index))
 		r = kvm_arch_gmem_make_private(kvm, gfn, *pfn,
 					       (kvm_pfn_t)1 << *max_order);
-#endif
 
 	folio_unlock(folio);
 	folio_put(folio);

-- 
2.55.0.887.g758fc8c411-goog

