Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2209F63A0
	for <linux-coco@lists.linux.dev>; Fri, 18 Aug 2023 18:15:30 +0000 (UTC)
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1bde8160fbdso17125105ad.1
        for <linux-coco@lists.linux.dev>; Fri, 18 Aug 2023 11:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692382530; x=1692987330;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2UpHtort9A6GjNTa35crOHhwpakPEKD1yUlcxtVr0FM=;
        b=Wf3bir3HeQk+WypI1ZAPThcOJ8gBnSqr+4uMmAGs5XkTifA1Jk+MIDWHiHZRdNk0+C
         M5661hEphU/S9CH1QehwULjXmETLlJNjdYP7x4EH3ZdU2MpvGa5UN9y+2vDZICrkZDzZ
         9a649TKMt+pSSYcAeMrscys6un16n6z/fPt7iyYlqM4sbvaWGeLiX+6zLD4vT13u8GdA
         3bdku6+tGWd8ndlrBLcc0mCDTPvthWqpoilu/rEO+XcSveGnU4nmPXc5G48yPu6t9WW9
         xAesWTGzznMOvZ3+KVJhuC/+J7hHFF43hvk0Pb9RuSXACDXlbQZZQTwmjhwqyIP7otfl
         IU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692382530; x=1692987330;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2UpHtort9A6GjNTa35crOHhwpakPEKD1yUlcxtVr0FM=;
        b=AkR4BWq1poLMWD4d9KSq18trwyLyDW/lz5cHlA6tYhDBul4LEvIKIKP0bm+WF6Rof8
         QmZ48UOJqZLh0cKiEmpB3/O5/OlYAA1ycX6+3uYLwZByhLLrtow1CttSGsFFDCZ0wwZ1
         GQkwdMdZMrtdOC22dQd5FpSgEp78DmUgB3Bxyd+7dlwfhXMCpk+b0u7eaEvzB8OjTbqS
         +TpBHS44LGLdJ7TsN4zuk4xkTGXlttG4l0T3iwlAX6cF+poimiY9ZhHneQVhKjrjwjbT
         C5Gqk+zg3T0smweqUTb5pm2AC24aMnlerLgWLEWzrRMOskmdg1HnCVK/QVbU9CU7AOqu
         aqlw==
X-Gm-Message-State: AOJu0YyoSNJNiNGnKAI0pxc0gqWj9nKgI30AQCTD72rA0aT1Ii9isdfk
	JoMHiNmBr+UsQTIju2EfoSGKpII06Sk=
X-Google-Smtp-Source: AGHT+IFIP6KRkFSo7uDQ6UxRK3c68Ehxfv1w9ffi6BGnhY+oGbePYtHkVZUTFVjvumMFptQ/4PuZ+lXpYqw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f547:b0:1b8:8fe2:6627 with SMTP id
 h7-20020a170902f54700b001b88fe26627mr1183892plf.8.1692382529796; Fri, 18 Aug
 2023 11:15:29 -0700 (PDT)
Date: Fri, 18 Aug 2023 11:15:28 -0700
In-Reply-To: <c3128665745b58500f71f46db6969d02cabcc8db.1692119201.git.isaku.yamahata@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1692119201.git.isaku.yamahata@intel.com> <c3128665745b58500f71f46db6969d02cabcc8db.1692119201.git.isaku.yamahata@intel.com>
Message-ID: <ZN+1QHGa6ltpQxZn@google.com>
Subject: Re: [PATCH 7/8] KVM: gmem: Avoid race with kvm_gmem_release and mmu notifier
From: Sean Christopherson <seanjc@google.com>
To: isaku.yamahata@intel.com
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	isaku.yamahata@gmail.com, Michael Roth <michael.roth@amd.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, erdemaktas@google.com, Sagi Shahar <sagis@google.com>, 
	David Matlack <dmatlack@google.com>, Kai Huang <kai.huang@intel.com>, 
	Zhi Wang <zhi.wang.linux@gmail.com>, chen.bo@intel.com, linux-coco@lists.linux.dev, 
	Chao Peng <chao.p.peng@linux.intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Yuan Yao <yuan.yao@linux.intel.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Xu Yilun <yilun.xu@intel.com>, 
	Quentin Perret <qperret@google.com>, wei.w.wang@intel.com, Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Aug 15, 2023, isaku.yamahata@intel.com wrote:
> From: Isaku Yamahata <isaku.yamahata@intel.com>
> 
> Add slots_lock around kvm_flush_shadow_all().  kvm_gmem_release() via
> fput() and kvm_mmu_notifier_release() via mmput() can be called
> simultaneously on process exit because vhost, /dev/vhost_{net, vsock}, can
> delay the call to release mmu_notifier, kvm_mmu_notifier_release() by its
> kernel thread.  Vhost uses get_task_mm() and mmput() for the kernel thread
> to access process memory.  mmput() can defer after closing the file.
> 
> kvm_flush_shadow_all() and kvm_gmem_release() can be called simultaneously.

KVM shouldn't reclaim memory on file release, it should instead do that on the
inode being "evicted": https://lore.kernel.org/all/ZLGiEfJZTyl7M8mS@google.com

> With TDX KVM, HKID releasing by kvm_flush_shadow_all() and private memory
> releasing by kvm_gmem_release() can race.  Add slots_lock to
> kvm_mmu_notifier_release().

No, the right answer is to not release the HKID until the VM is destroyed.  gmem
has a reference to its associated kvm instance, and so that will naturally ensure
memory all memory encrypted with the HKID is freed before the HKID is released.
kvm_flush_shadow_all() should only tear down page tables, it shouldn't be freeing
guest_memfd memory.

Then patches 6-8 go away.
