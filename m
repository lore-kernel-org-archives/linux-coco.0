Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794210080;
	b=dbR0VeUE260stR7wQTuK/h9GwTP2qmWMIkeaSOz7p5XKb0JBvCLonvtX0G9hUzOLkPEv
	 1jKOryvwp7HELkafEXE2A5qQed/XQjxwOj4onf3gXWlwIax2XnF2UDxwOAx513y/WSRR2
	 QDsIGsgenunJlVAUhsfhKkG1s/99FasY5UiigkluVgi9IOcpEr4hsmqwx54MlKgx4B0bF
	 QEM/DWZUwQCG7wXthEqsbWJXpOzeMyWieLRoxw2EhRLOpkUHxmDxLXnlTemLknzMfmZw0
	 E4jChbB/FtPv6beJgVuTh0fguxoJfRmTPOnekor2tvCpz4aGrFF/gajMJIFCzbXzKWA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794210080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=3/KauWaXYG3OmrhCNO3AADgebVTxE9yJqLBY2sG9Sb0=;
	b=5ZMpuMjR/W94ebKw/JeC7sOmi9ZMkBf+pURy38vF/pz4qELFlQoHeLORxB5AUezIvNxu
	 /mPPuCNm4GOJNtICenv1W88ME7cPoxI3S2PaIlH5ENwGxDi+cIs/BY9HiZPzp+bQlnPpy
	 60HJj+IBaIMtHKswlpQueZGm3sveISSvhAzb4wV2IfhiF4x//+cCC3YkW4OhUxJNp2qo0
	 UpHP0iEVfKcR68x7B+6ITxDNPzr9wpbYeIdruVUzcA6VqG40mJa35BbEImw3d/FM4Dl0L
	 g+3N+QIH6EEzkIC+dPkh4tx/s/ntvnVOtMoi8W9cB/qUcHR9rYAKUpGjd8Y7hqLFAdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HeEDTS3j;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEE1606A31C
	for <linux-coco@lists.linux.dev>; Mon,  9 Nov 2026 07:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BEE1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HeEDTS3j
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c144eb2f43so1968e87.1
        for <linux-coco@lists.linux.dev>; Sun, 08 Nov 2026 23:41:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794210078; cv=none;
        d=google.com; s=arc-20260327;
        b=qfbhjLGWuy45tfpINz+wSKmTxBRowIn8v0zeor5O6xy58sclKy9lsmz8GG9jRiw9fR
         XrRVuZwGHRCiLR2GdlKGfnPn4QJ1CVhX53HNw7v12rf4ycPmUq999PA7luOPSyDlYzyr
         +SPJA6Zn7eDsGCchAKnm1LOqShf8/HZRM5ucUhh1K8OFraAMprcZbhqBVHM7QVEMEjRr
         +c9xzLa9OXkt9HxqgmMKqBJ/Cl2S+RwjQD5aNq4EkuqEvk3CiNy2VVZhWY3KecSl9eTy
         T7mu5c/Wm+BzEs9bkDZ/hiA3wS+n6i+FzVkccF1UJosIpjv4dOzP0RHJ0nPNS07HacTJ
         UDzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3/KauWaXYG3OmrhCNO3AADgebVTxE9yJqLBY2sG9Sb0=;
        fh=35h0WqxxvD3zwmRdQLluULy1vNmeKUyK2bpxlP7ydjg=;
        b=dhWRu3719kej44DHiRlLxcrCBFbv67g2gV4AuDTNhhBv0aHquhTNQGkRlXKv+eyEED
         QIr3HsVwqrB2lTOrMKtg0nL6CgbJj2JJEddgrp4IhF7jQRhfP1JzdcLXa8jcvdZyt588
         moGBTc/9GYSJQVRbSm5xz0qlNbKT3Tv4eDVkeikff9krPBdAwDAVttBVtArDCgU68N7r
         PpVaaw5xDvsmL/qEUIIYmKXG2NVfS/hXAR+FF1vI1r+LpKkS+wtSXXZpXsh2zFhi1J5P
         6iU/h3mQg/wK6AxFfGZldZNa2p+4gEOg6n6KujJysPQv8bURMclcd9tcw6IRl8geDznL
         NEKw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794210078; x=1794814878; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3/KauWaXYG3OmrhCNO3AADgebVTxE9yJqLBY2sG9Sb0=;
        b=HeEDTS3jKC0VEYSnams1BIV+UpZ/ty/+2FSDqf7rTCxMSqdqwygQr0SQfzQ/wkJ4jF
         y2x8OYuaSyNco4aiiuYtgB30jZQ05deATdmnT8Kv1yO53HoI05ry7r0rVspYtbNxFMcU
         AHUGY3a9R8CumfUlSrNG1xIGFtJUVyJZAftplNOmjbda4JXrwtkFt9UdjyUatb49hL1x
         0To7kP50yVNksae6nbgQnbT6amzdHEs5ch0R0MwXdTFWMpJoS6lqKJWrUkVeBdMyLqml
         qsKaD0fYs+ZH6xOfBF8paWH673R2QKcHFcvhgDOEY23oE2TUEJOPKTCe6RINIpvO5QdX
         u7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794210078; x=1794814878;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3/KauWaXYG3OmrhCNO3AADgebVTxE9yJqLBY2sG9Sb0=;
        b=Qn2UXv2E8SBc3qdJRm13FMqkAaxmIO45UNttugLW83mdo9Xyak843PAbOjAJlAYYau
         KVX8MrAUbzHfTDTAL//hbGr2Ij3rMYhmzEExJBROlEs4gCBsAetKK7nMcAdbqFCjAFSh
         3OA4c5bccIAKpqbmE9lftKw0b3XTukk/bFMzoGaDhhJYAgLNz8Bwd74rvxgBBl05mYEp
         1cfQzRpEqq+20yigkNQO9d9ejeR+c5tF/sGAe5OiZMTunZw3eiBIylL3PQFXpM934mWX
         pV79UiXZ5IeMbDJu/tl3hQplv+x4mdAKj4EdKk84lFyCDcxljMdcwmfakOnNS0y+YwXT
         U55g==
X-Forwarded-Encrypted: i=1; AL+hErF+N9ZiwTksOYhPbgB0+MUHIzonJQyHytuFHqrPLWO+PsHL681WE4yBB8V8cqrhDJ+YVnC5QVHkCkHQ@lists.linux.dev
X-Gm-Message-State: APuU4Z8SpXazgAhFdbkgSbDJu4Rod5TAqZwes2WDpyjNSG5DMWqedwWZ
	ZuDsvD+EeBOdfCvOS1AZ8gcR+oMo/BRLeG0j1aT1KwS+rk75YeXsWOvuCGJo9sIM+tEuB+VHz9b
	yRwU8YAZrLlG3UTe3cniCnaNvew2Za55uw6cwyFoj
X-Gm-Gg: AYBFou2xhXID+7xZap9B6r+20XtfiwCzpPBJMVdgkhbkCMP3+qJbylb9GCKTjUqe2Yp
	BXGu2kJEr1E0L8zJ0EWqivZq2yMIugNYG/n7uV10Q8klwiPRea16JCgthnyZTxMZmsKxcM3MqYq
	P/y9T3zfjT5n/CEZBQd4YqSHGQUl1mhsQvmVZcPzCZPP/6gZzhs2jayyOtLw/e7jjJ18L/tn4Dj
	v8fF5SpZa6DZYJSMqp4MmKEGSlbHPtfmf7g9FSBkdrqqMVAOLIBNeP+BZDanF0qjjnkwHG8SI70
	YEUuqScXXRHihEh9DXFRbNFzoQXRo2rLeQvO5eA23MkMz2Vx/q/qHToDP5Vq1LwjEbOzZDCV6HK
	PxDoKxA1zAEPxXWFQB8Imd8KPWOWoaL691Ng19qwwBWaor2tn1QZveyLYkvQojiRacgyHaYTy50
	8xZvV3h494Usbg5c1EAZHOXpb2OQ==
X-Received: by 2002:ac2:4bcb:0:b0:5c1:53b5:2029 with SMTP id
 2adb3069b0e04-5c153b5217fmr3411e87.15.1794210077813; Sun, 08 Nov 2026
 23:41:17 -0800 (PST)
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261102141304.126883-1-steven.price@arm.com> <20261102141304.126883-11-steven.price@arm.com>
 <fa0ee5a1-4c49-4c1f-bfbb-c270dc4b6301@arm.com>
In-Reply-To: <fa0ee5a1-4c49-4c1f-bfbb-c270dc4b6301@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 9 Nov 2026 07:40:41 +0000
X-Gm-Features: AclHuK87iuKTvXEWJaczVerdWgxPEZxpPBN7O-wc8AIa5Wl9vz0b6-1H_UF4Qbg
Message-ID: <CA+EHjTy970AWnhYoZ5OqxQ8ojCAELeejw60y2NmpDsM_ZMdu4Q@mail.gmail.com>
Subject: Re: [PATCH 10/11] KVM: arm64: CCA: Support runtime faulting of memory
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Suzuki, Steve,

On Thu, 05 Nov 2026 17:30:16 +0000, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
[...]
> > @@ -1816,13 +1828,28 @@ static int gmem_abort(const struct kvm_s2_fault_desc *s2fd,
> >         /* Pairs with the smp_wmb() in kvm_mmu_invalidate_end(). */
> >         smp_rmb();
> >
> > +        if (kvm_vm_is_realm(kvm)) {
> > +                is_realm_private = kvm_realm_is_private_address(&kvm->arch.realm,
> > +                                                                s2fd->fault_ipa);
> > +
> > +                if (is_realm_private != kvm_gmem_is_private_gfn(kvm, canonical_gfn)) {
[...]
> I am wondering there is a way to make it a bit more generic. The issue
> is, only Realm has private memory with guest_memfd for now. Don't know
> the pKVM plans for it.

The plan is for protected pKVM VMs to be backed by guest_memfd too,
which would also hold each page's private/shared state [1]. So
kvm_arch_has_private_mem() will be true for them, and this comparison
applies as is. Only how the expected state is computed differs: for a
pVM it comes from the per-page share state rather than an IPA bit.

Steve, could you gate the guest_memfd checks on
kvm_arch_has_private_mem(kvm) rather than kvm_vm_is_realm(), this one
and the memslot check you proposed for 02/11? Only the
kvm_realm_is_private_address() and realm_map_ipa() calls are
realm-specific, and they could be VM_REALM cases of a switch on
vm_flavor, as Marc asked for on the v21 memslot check [2]. The macro
would then only widen to protected VMs when pKVM's guest_memfd support
lands.

Cheers,
/fuad

[1] https://lore.kernel.org/all/CA+EHjTz+WgXEW5RTxXf4oGeEb1Tsm5Ha4nOc4S1jBcp7jxP4+A@mail.gmail.com/
[2] https://lore.kernel.org/all/86mrsw2jrn.wl-maz@kernel.org/
