Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249381A593
	for <linux-coco@lists.linux.dev>; Wed, 18 Oct 2023 18:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h9vghAXh"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5a81ab75f21so71804337b3.2
        for <linux-coco@lists.linux.dev>; Wed, 18 Oct 2023 11:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697655383; x=1698260183; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8u57CE8Kdi0g3jbFeaVMUNjtuMyTsXSOw82lfN+HY7s=;
        b=h9vghAXhFxXkNwxnF+z0BVyJk9iz1M4JwPdTEfsltkfb/u6AbCWnaskKIsklypcwS4
         +AMbr9dzVi3dhm//ONPQMO0iB4IKSSs++2vZ1eRGQJkGdsqOPQqQZHb+53XOXpUxIdAQ
         F8muhf9vf3vDhW0LRo/ssOxKfp0kCoBLBR4wOt02VXiDpfqSvSAmemjZdhxlJYGvbmsm
         vS0ohTmfRpQDxkj2GCZUU0Cc+y70Pqbk1b+ET2LJENzdGuD1uEHmI/CGq69ZFnfaKmUL
         /NZH6D2u1K7VBGh7J788npRjBeiyk4XUwfGTGSrsrTyoiaTxTCyKXVWcMg64fSzqZXV4
         B76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697655383; x=1698260183;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8u57CE8Kdi0g3jbFeaVMUNjtuMyTsXSOw82lfN+HY7s=;
        b=WDH1ILqk02g2w+4TaFmOTGLxCdYeh90PtT8cxfxzd/g9tyfYki5UJu4Jis6Jd5dEI6
         PMtlhpQnIOyx+mqXsrZcdMQLzkl9sF0wE9/Ln1kaRzE2ddgfCeZP5lKZFwrpssZSmQ2I
         0SiIgL/Ic8DsN6jTYsF0zAN2sUIp0cmVxhdTQmzvF7zb3UK6VR+J9YQ0UJQscvmd+1W+
         GXidg0T9jDHL5Z+IlORdNqzzftA+oOdprIfgdnXaRHrqrhKcBvFoeXyi/kajogLsdvgW
         MDJK/icZunaeavTzwjPu79h9ASqZHbOiVZ2kx48b8lPAXVtuNV0mgAN6YSN3YRF/zkLb
         q8JQ==
X-Gm-Message-State: AOJu0YzK3a6jdYpcFCir+MU4kYsEEsxe4LOj4wdZDLlBjc6EhcwJewzD
	i1LCRPndVUS6cPss+ic8MYpk8LmN232PJ15Q+Acs/Q==
X-Google-Smtp-Source: AGHT+IEVthnA6CU9mpkTsCHlLVMIzAPKmS4ZaPXH4ULIXiZ+5TAJwScCOKMTezMaxNwS+k8Jz117dmhU1EvVRABxWDU=
X-Received: by 2002:a25:b7cf:0:b0:d9a:d895:2ede with SMTP id
 u15-20020a25b7cf000000b00d9ad8952edemr238953ybj.16.1697655382857; Wed, 18 Oct
 2023 11:56:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Jianxiong Gao <jxgao@google.com>
Date: Wed, 18 Oct 2023 11:56:10 -0700
Message-ID: <CAMGD6P3szwE-ji3sJsow5PPuazqQjQhgN4ZKFmUmZJ0Gfz=ByA@mail.gmail.com>
Subject: Re: [PATCHv2] efi/unaccepted: Fix soft lockups caused by parallel
 memory acceptance
To: michael.roth@amd.com
Cc: aarcange@redhat.com, ak@linux.intel.com, akpm@linux-foundation.org, 
	ardb@kernel.org, bp@alien8.de, dave.hansen@intel.com, david@redhat.com, 
	dfaggioli@suse.com, jroedel@suse.de, kirill.shutemov@linux.intel.com, 
	linux-coco@lists.linux.dev, linux-efi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org, 
	Marcelo Henrique Cerri <marcelo.cerri@canonical.com>, mgorman@techsingularity.net, mingo@redhat.com, 
	nik.borisov@suse.com, pbonzini@redhat.com, peterx@redhat.com, 
	peterz@infradead.org, philip.cox@canonical.com, 
	David Rientjes <rientjes@google.com>, rppt@kernel.org, 
	sathyanarayanan.kuppuswamy@linux.intel.com, 
	Sean Christopherson <seanjc@google.com>, stable@kernel.org, tglx@linutronix.de, 
	thomas.lendacky@amd.com, tim.gardner@canonical.com, vbabka@suse.cz, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

The patch helps us gain more stability in our testing.
We are not able to reproduce the soft lockup issue in over 20 runs
with 176 vcpus so far.

Thanks!
-- 
Jianxiong Gao
