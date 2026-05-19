Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65A4229B12
	for <linux-coco@lists.linux.dev>; Tue, 19 May 2026 00:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779151360; cv=none; b=uBJzxUVbvG/knBOZ+DlqpAame7eEfXNj1rI+q8uPdmpsr/zLiFEPAQwcY/LOwe3tsX6dcIzg0HHMsnxmootKXZnoXodqKfburZ03feDZGIABDJ0aHrfgyxK61RFR/YYJAk0caCls/4Tz4yMyBi3sveSVVRABdzZSbSQ0Kqk7E/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779151360; c=relaxed/simple;
	bh=GiB4NgaSW9wzhpzOctOgrRLGNPibIqPgLRcvSh4cIB8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cGZtm9CQEno1brhcR9CQk3L6HbnyfQCEJkRpF6s5Ppo9w9qgKdyWI+TRV5WdjhUQ+c6uKJV6YzliXgy8v9qxrJugLDyR1dRdY/FhLW8gn6nAEHqs3ER5hnuK1/v2+cb7uxzt0YcR/XKSb0i3JG+pE7PobzF8GTbTmWPFC6Lnbco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oBI+Mjh1; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oBI+Mjh1"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2b2ecc96a9aso33999305ad.1
        for <linux-coco@lists.linux.dev>; Mon, 18 May 2026 17:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779151359; x=1779756159; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=T8bS1JIyLf3L74nyvyziIuw+0b9p5Mm/yLMtr7KTpLA=;
        b=oBI+Mjh1EsZV5NPoUJSIpdy7Tosf8FKenFW5f6pC4Uvlbcl+fmV4J2hToqqoILwuAH
         QrXRQN2SMN7RLuPEzO82PrYlJ8mB9Ng0X0qnADk//TriysvTa+wgT21d61R8qOLYX+bL
         SkOLoej72BHSAr//gc1gYBq4HbhcUgOe3S30Dv/Cksij+gI4sSgDoPtYB7VELLVEndzD
         9uNNFoLFpW//y28jmaqTPcf8Dh1v2ePvBqm6fiaoWD5DnNQGa+ebojoXJUxfv9Oskl7q
         LjhV/1UToxGMjWDil17oNSXA6lmnWTDGkQwD9Wh8bSJ6URtiMfeX8q2UXpPE7tOGIqHn
         6Z0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779151359; x=1779756159;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T8bS1JIyLf3L74nyvyziIuw+0b9p5Mm/yLMtr7KTpLA=;
        b=qwFcyzH1c443YmYU2c+eQPYO7y/M/WlFZXgUdxvF4KLBctquItQmZ9zekQgnV1HUGF
         wgp4bUsZbWSq0L9tfZyIqHS1zQm9aifdaA90MvT195AHVA7nAu0WhUCeD7JTAz7XYPyK
         8KHALLCkg2SAu/4ieXmJgekz/nhbh0m0G0Gcgdn2IGsv/4vi1MmGthAkEDJcJ+zWcxMp
         04Lb4nlVjwYfA16jkhMbFTETDni9Rhgm/hXhv4tka4BblqJsxD9oL3QLE51wbwK8amEK
         Js/gRZEOLP7FWwtbD5vPhzR8DftawyejOtxsKON/dPN1eB+hwJm91TyIc+KqLHdJ5Ijb
         t70w==
X-Forwarded-Encrypted: i=1; AFNElJ88yUaep9MaR2MYMJrEy/LUaF/06jHcEdqBlDm2DxG0oAp+NOI361IAr3PlAmmhHzxdDnT3nx8eXFbs@lists.linux.dev
X-Gm-Message-State: AOJu0YyGyPPjkccoDWlvsaLTgqqTOCovvxp5uj0SBIMfsAGadofSIanM
	gRiNBw+FkCOYgaHtC8eJDB8HE1P7Y8/IQUjWkm3JiHt+b28hrb9HSQ7/JUagMGMHhmfRsTU1H72
	PY5KleQ==
X-Received: from plbmc15.prod.google.com ([2002:a17:903:2b0f:b0:2b0:af76:bcc2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2c06:b0:2ba:73c4:4a77
 with SMTP id d9443c01a7336-2bd7e8fcbe3mr181361435ad.9.1779151358945; Mon, 18
 May 2026 17:42:38 -0700 (PDT)
Date: Mon, 18 May 2026 17:40:44 -0700
In-Reply-To: <20260129011517.3545883-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260129011517.3545883-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <177915048117.2225067.12213687050498218442.b4-ty@google.com>
Subject: Re: [RFC PATCH v5 00/45] TDX: Dynamic PAMT + S-EPT Hugepage
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, Kai Huang <kai.huang@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Sagi Shahar <sagis@google.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="utf-8"

On Wed, 28 Jan 2026 17:14:32 -0800, Sean Christopherson wrote:
> This is a combined series of Dynamic PAMT (from Rick), and S-EPT hugepage
> support (from Yan).  Except for some last minute tweaks to the DPAMT array
> args stuff, a version of this based on a Google-internal kernel has been
> moderately well tested (thanks Vishal!).  But overall it's still firmly RFC
> as I have deliberately NOT addressed others feedback from v4 of DPAMT and v3
> of S-EPT hugepage (mostly lack of cycles), and there's at least one patch in
> here that shouldn't be merged as-is (the quick-and-dirty switch from struct
> page to raw pfns).
> 
> [...]

Applied 1-4 to kvm-x86 mmu.  Please yell if this was unexpected in any way.
I'm pretty sure this is what we agreed on, but the last few week have been a
bit chaotic...

[01/45] x86/tdx: Use pg_level in TDX APIs, not the TDX-Module's 0-based level
        https://github.com/kvm-x86/linux/commit/4487492b92a4
[02/45] KVM: x86/mmu: Update iter->old_spte if cmpxchg64 on mirror SPTE "fails"
        https://github.com/kvm-x86/linux/commit/02eaaffdd865
[03/45] KVM: TDX: Account all non-transient page allocations for per-TD structures
        https://github.com/kvm-x86/linux/commit/a8b2924676ec
[04/45] KVM: x86: Make "external SPTE" ops that can fail RET0 static calls
        https://github.com/kvm-x86/linux/commit/e1a31ca28c9d

--
https://github.com/kvm-x86/linux/tree/next
