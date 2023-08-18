Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042E9174DA
	for <linux-coco@lists.linux.dev>; Fri, 18 Aug 2023 23:14:34 +0000 (UTC)
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-565aee6e925so1822346a12.0
        for <linux-coco@lists.linux.dev>; Fri, 18 Aug 2023 16:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692400474; x=1693005274;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5DZepNUwrlYIieQTJr9Dh/3tOxOseVHo5Xld8dMNuNg=;
        b=lsQ+HVzfe/LvJcjpi5EkUeNksPQ4SKFkDuitTo8QZ8/V1sWcr6kxph8TKOQUDPuQY6
         3R+Pf/jmvF5hwJvwA/qd5EZ3umv7mDUrFv27YvRHTc8kZljL+me7hAdDiSfTlWvFfEj/
         coNhxIPQ3jfxMfHlGddYmQDEEwSQ+Y5RTQnvOpYtmp6kPuX7mXVgS6zWmHmU+sPbmIdm
         3HwG+UlgYVsM7jRmT+4vVPawxf3yitDSjepBo5MpteRZM1D0Vdl8EmV210P/oEzmRyXa
         r4YJEufogWKx1B2Git+TQpUucYnwL9g/7hgB267fQrq1A8h/ysQfdzEjFcPJQrGcpD54
         aN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692400474; x=1693005274;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5DZepNUwrlYIieQTJr9Dh/3tOxOseVHo5Xld8dMNuNg=;
        b=hFHqY17hQoe6Mevc8nK/URFNcSaAPADs907S9oy+VxHzXLw9hxzXy3mg6daJzOHGV0
         d0ECOlEiTouHXWh2e5d2FbO8JKi5Kv6J3OfhbGcR8Mb9VutAMUU9jjOXA9ZbuNCObFyL
         iRfD+414yYD43Ibp8s8J5TG1J1wayOR363QATTpXDCcw+m6f/s3zlDO2wS4FuE5A1yOa
         WJP3h43+LVhMFwNh/PT5e8pROkDb/azuQ7NSL9QAyguHo8gQ/mwBANbkJQVbcbzY4v2n
         s3M6tavnfShSA4rxSwePA969RMKBiaXaaGwqH+LAIX8m+7LUDBSpOhdHUUuHdNvVlTcP
         KFQQ==
X-Gm-Message-State: AOJu0YyrWURzxxbyvYPzkTLgTQq4XNiO1yDC1AogU4C8sXh76FBIDILu
	iaI8iGMl2gpm1zGagJdoKkFF+RloDlI=
X-Google-Smtp-Source: AGHT+IF9HyPZ8NYi1dOCnWJqmB9Xg8StOO2+i4hjQBZ6kPAEn5MgrO+XU77nUxSPGBzB9RxPZ8c5rXOzSME=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:3ecd:0:b0:565:56be:4dee with SMTP id
 l196-20020a633ecd000000b0056556be4deemr124213pga.8.1692400474224; Fri, 18 Aug
 2023 16:14:34 -0700 (PDT)
Date: Fri, 18 Aug 2023 16:14:18 -0700
In-Reply-To: <cover.1692119201.git.isaku.yamahata@intel.com>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1692119201.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
Message-ID: <169239820500.1761806.6161030396328593760.b4-ty@google.com>
Subject: Re: [PATCH 0/8] KVM: gmem: Adding hooks for SEV and TDX
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	isaku.yamahata@intel.com
Cc: isaku.yamahata@gmail.com, Michael Roth <michael.roth@amd.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, erdemaktas@google.com, Sagi Shahar <sagis@google.com>, 
	David Matlack <dmatlack@google.com>, Kai Huang <kai.huang@intel.com>, 
	Zhi Wang <zhi.wang.linux@gmail.com>, chen.bo@intel.com, linux-coco@lists.linux.dev, 
	Chao Peng <chao.p.peng@linux.intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Yuan Yao <yuan.yao@linux.intel.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Xu Yilun <yilun.xu@intel.com>, 
	Quentin Perret <qperret@google.com>, wei.w.wang@intel.com, Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="utf-8"

On Tue, 15 Aug 2023 10:18:47 -0700, isaku.yamahata@intel.com wrote:
> From: Isaku Yamahata <isaku.yamahata@intel.com>
> 
> This patch series for KVM guest memfd is to have common code base for SEV and
> TDX.  Several minor fixes.  Based on this patch series, TDX KVM can defer page
> clearing without mmu lock.
> 
> Isaku Yamahata (6):
>   KVM: gmem: Make kvm_gmem_bind return EBADF on wrong fd
>   KVM: gmem: removed duplicated kvm_gmem_init()
>   KVM: gmem: Fix kvm_gmem_issue_arch_invalidate()
>   KVM: gmem: protect kvm_mmu_invalidate_end()
>   KVM: gmem: Avoid race with kvm_gmem_release and mmu notifier
>   RFC: KVM: gmem: Guarantee the order of destruction
> 
> [...]

Applied patches 1 and 2 to kvm-x86 guest_memfd.  I'll post the alternative
approach for fixing the unlocking bug next week (need to test, and I'm out of
time this week).

Regarding the initialize/invalidate hooks, I resurrected the discussion from
the previous version[*], I'd like to bottom out on a solution in that thread
before applying anything.

[*] https://lore.kernel.org/all/ZN%2FwY53TF2aOZtLu@google.com

[1/8] KVM: gmem: Make kvm_gmem_bind return EBADF on wrong fd
      https://github.com/kvm-x86/linux/commit/07ac04fbefce
[2/8] KVM: gmem: removed duplicated kvm_gmem_init()
      https://github.com/kvm-x86/linux/commit/9ab46d91d5ea

--
https://github.com/kvm-x86/linux/tree/next
https://github.com/kvm-x86/linux/tree/fixes
