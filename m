Received: from mta0.migadu.com (out-187.mta0.migadu.com [91.218.175.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164D839D6FD
	for <linux-coco@lists.linux.dev>; Wed,  9 Sep 2026 11:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954346; cv=none; b=Ovv7DIX0HQurUMyTA5m9bzocdlhN9NY6cht4tkIJrfKmp/UT/ef26e1rpUiYBlcn8PhGpHdqI8wnt6W4nL2fJXt/yfFhrw9y+dsDSBhYE39hAkiFYaZ3QgwzDsUUAJKxjJKhxDeB4s+ZymQoo15+rVuyYSCsKsn636suaG/ROVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954346; c=relaxed/simple;
	bh=sQ18SBZz/15tq9LdAqx8ijDFA5shEKNGRQQl0W2IYqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bPG3CMsuYnxTBYvw7fo4zNzEoBXbRxRE8cdWVuXUaMBkEgWDOz9rB6MgmKSJXOA9CI3+8SiTtvoavs0VSW/X8hhllS4yA3665DDzqHAeKWTnEi5XPM+Ilx9A2zU/YYk9JW7JtJ379TNpH8SVC/ZWBuYqXlCooRFMMdNfq2fbEjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZWedJTPN; arc=none smtp.client-ip=91.218.175.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZWedJTPN"
X-Envelope-To: linux-coco@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=sQ18SBZz/15tq9LdAqx8ijDFA5shEKNGRQQl0W2IYqs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788954341; v=1; x=1789559141;
 b=ZWedJTPN3GQUm7Yn5VnUnCC5Y4zqTZl1ZvIEu11XZ4xD0GFU+wPJxRRhBjGMk1JmGWw/3nPR
 AIvdafRllOFxtB6m1Jaaav+lRN4eSeRYtbuwmlP0D1h8Nrq4Sr+Sv5IdwXjO1oEuXGHBzfi5ObW
 fbynvIoU86cgeHj8lUn8OQu4=
X-Envelope-To: linux-coco@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id f9c0b5e72e4dbbf3;
	Wed, 09 Sep 2026 11:45:41 +0000
X-Mizu-Trace-ID: f9c0b5e72e4dbbf3
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b17359so6270e87.0
        for <linux-coco@lists.linux.dev>; Wed, 09 Sep 2026 04:45:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwpLIqptPe6Uby6erOLTRIClEhzQUNk52VVC7GeNELTTiZH4TL58NNPFmIiFGyEhRKK2KaXEdU4czdH@lists.linux.dev
X-Gm-Message-State: AFuF++l1jfPWA58OCZ/wi+EK/jrnghDy5nLWD5FykaDRswfMyMYugO2/
	Zpd9YjXjQ9dWXUoG5RXrqO2y8k/2DwKok3Cg4C63VMHbVzrCqO46EBb7LsjMBA+SiMFR+ybIAuk
	Ep++LrJvjVxI9bSK82efnXdD0LKqKAm9DUrRGZMvJ
X-Received: by 2002:a05:6512:33d6:b0:5ae:b726:5f1f with SMTP id
 2adb3069b0e04-5b764bba50emr123963e87.8.1788954336783; Wed, 09 Sep 2026
 04:45:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908162223.1683432-1-suzuki.poulose@arm.com> <20260908162223.1683432-11-suzuki.poulose@arm.com>
In-Reply-To: <20260908162223.1683432-11-suzuki.poulose@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 9 Sep 2026 12:45:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw9ReyvsNT=y+-P6ng7VQ6Pvz9PFK9bO71qvTR1pOxx5Q@mail.gmail.com>
X-Gm-Features: AcwNN1VYRy45FZko0UuMaXxNySje8Pm0dy1h12UkU18r19Bom2n2H4FesuVJEUM
Message-ID: <CA+EHjTw9ReyvsNT=y+-P6ng7VQ6Pvz9PFK9bO71qvTR1pOxx5Q@mail.gmail.com>
Subject: Re: [PATCH v17 10/20] KVM: arm64: coco: Disable Steal time accounting
 for coco guests
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com
Content-Type: text/plain; charset="UTF-8"

Hi Suzuki,

On Tue, 8 Sept 2026 at 17:23, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> PVTIME support is advertised by KVM_CAP_STEAL_TIME, which doesn't take into
> account the kvm instance. Even with that, a VMM could skip the CAP check and
> proceed to configure the PVTIME as we don't do further check on the DEVICE_CTRL.
> Tighten this up by passing the KVM instance around wherever possible and
> catch things early
>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

...

> -bool kvm_arm_pvtime_supported(void)
> +bool kvm_arm_pvtime_supported(struct kvm *kvm)
>  {
> -       return !!sched_info_on();
> +       return !!sched_info_on() && (!kvm || !kvm_vm_is_confidential(kvm));
>  }

I think it would be better to leave KVM_CAP_STEAL_TIME reported and
instead reject the configuration for these VMs, returning -EPERM from
the KVM_ARM_VCPU_PVTIME_CTRL attr. A capability query should report
what the kernel supports, not whether a given VM may use it; gating it
per-VM here is also inconsistent, since the !kvm clause leaves the
system-fd cap at 1 while the VM-fd cap reads 0. And -EPERM says that
steal-time exists but isn't permitted for a confidential VM, whereas
-ENXIO reads as "no such feature".

Cheers,
/fuad

>
>  int kvm_arm_pvtime_set_attr(struct kvm_vcpu *vcpu,
> @@ -81,7 +81,7 @@ int kvm_arm_pvtime_set_attr(struct kvm_vcpu *vcpu,
>         int ret = 0;
>         int idx;
>
> -       if (!kvm_arm_pvtime_supported() ||
> +       if (!kvm_arm_pvtime_supported(kvm) ||
>             attr->attr != KVM_ARM_VCPU_PVTIME_IPA)
>                 return -ENXIO;
>
> @@ -110,7 +110,7 @@ int kvm_arm_pvtime_get_attr(struct kvm_vcpu *vcpu,
>         u64 __user *user = (u64 __user *)attr->addr;
>         u64 ipa;
>
> -       if (!kvm_arm_pvtime_supported() ||
> +       if (!kvm_arm_pvtime_supported(vcpu->kvm) ||
>             attr->attr != KVM_ARM_VCPU_PVTIME_IPA)
>                 return -ENXIO;
>
> @@ -126,7 +126,7 @@ int kvm_arm_pvtime_has_attr(struct kvm_vcpu *vcpu,
>  {
>         switch (attr->attr) {
>         case KVM_ARM_VCPU_PVTIME_IPA:
> -               if (kvm_arm_pvtime_supported())
> +               if (kvm_arm_pvtime_supported(vcpu->kvm))
>                         return 0;
>         }
>         return -ENXIO;
> --
> 2.43.0
>
