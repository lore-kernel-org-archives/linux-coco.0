Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68902E738B
	for <linux-coco@lists.linux.dev>; Tue,  6 Oct 2026 02:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791254287; cv=none; b=nAEVdXDhqzRQxg/gV2lw1ZlCOBIq+XcQKhKzh8icnU5LLUrvB8OmuQlwGB4e0rFn3t0EQ1hvGmIDFJppTOiyYo7X7Fslvi7WuHj84VT4FNW4RQq1K8CzzhTE6oH2c2hFLvDX132Zefx3NMf/pmpy1fF1TLDgp8ytulRS5tPDq2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791254287; c=relaxed/simple;
	bh=D0UxWkrGDJEjJknTZwzjCJ31q1+uUyqqvfVL7rYvYbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kug5qcQAkZQUX3oJS5NxTiNb4O4YmvqDIOMhBvq5mJ42XLNGWjfD0YXx8EjbaPYDZWplpFRiGfs5EhuW/uc6OzkdCam7i3QSKa0zptLH5afhOaUe3CypXV39a/FqCf1EzJvpWvHA6H33lVG37yf7o3/Klmg8DzNXvnmsemLHS/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eQQ7Vk+k; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eQQ7Vk+k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791254284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Di6epxlZpoHDGpBk057UhpR75wL2RoTA8HU7YmJFqJk=;
	b=eQQ7Vk+kFlXNfzFH9aDqc1Wgck6kR/gvO8ngr0e2ngOu51jgwu5Vzu0z6up+Kw3dueDBxO
	WFW3dJhpZ+68OCN4TjvwKXQGQPFSphLeQAojAcwiOqiTHnlVY5ZPWpSiNXf1Jxq9phGkHI
	N1wC1J9oPDZiWbxTe+DUgDcHXa5ww5Q=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-6EK0CK_4PwerbXOCu6C8FA-1; Mon, 05 Oct 2026 22:38:01 -0400
X-MC-Unique: 6EK0CK_4PwerbXOCu6C8FA-1
X-Mimecast-MFC-AGG-ID: 6EK0CK_4PwerbXOCu6C8FA_1791254281
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39533bb224cso2925520a91.3
        for <linux-coco@lists.linux.dev>; Mon, 05 Oct 2026 19:38:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791254280; x=1791859080;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Di6epxlZpoHDGpBk057UhpR75wL2RoTA8HU7YmJFqJk=;
        b=hOi8TvM1gzPeEHdJRvTy2mvTi+2ddpWf+ZeWvgURiyu9qPE9rYxb+U1zSDQfl1NVah
         FzUf4HaFK8XsksRfzy+PzwjR6GX7WS64UahCBLdkkaGJJJksr9/xeJGiN8x4DDci+Emk
         UFUHSqzeXU3D5Mm3Zkm6Kd3cnag0u+FtzEoB/hGdG7o/85NjK/P81YfpXBvNswfuLESo
         zMEZR5o5SIeGreLvVhOhuE7x8gXrG8Ux2EI8A47tL8+NwnoxWfz7KBWCjSOkwp02j4wW
         yYV9hvnBv8JIyXX7v9kWxqX90tUSnmQpaESkE9Y4LAjSiPYAufzdLzGbSIfwEg5m6OL4
         5mZw==
X-Forwarded-Encrypted: i=1; AKwUvBz1geApuVDBNO2BJbmXip/aTJlOtQg4mv74by/q44tWc01qI3g1mkcz2zNv+aMJpXpIdMcXnrOVvNlj@lists.linux.dev
X-Gm-Message-State: AFq9FYJQkza2gXW3KihYH8fyYV3zvs/nkS8A6BuGzzwU8QZ3vB6SLM6b
	UlLTU4pnX6iSBliKv6tpAIx0QaOljglPWV1FWcYE4fe+O/pjaQ6LXPgkZ4TzKhW02twYNHL3YKp
	EVrk3hq4lTcmRpd/qdh2eXlQBpZLFUwwxo6QzQfaNJfV2FUvwh8FppaqZdHDaji4=
X-Gm-Gg: AYBFou1Mslg5/8tTdvgeKaj/0SqJx11gnvUAiwu4v1/PMJeHwOI0uqKOkG0DCr808mI
	q+pTAE5+qcbzO4wEt2+UT5j8+qHqgj9/UhJwyjPQOKnSHqiGo2KcKg+2qyTUQrIlCZ9ZQo/VJz7
	toj+wVYezBYbykCM+cORhG04nGVmZk1tVtBE2StW8hngB0xSPGOKRkXHzNelezKKx6ihWQTiWpl
	OTqFjJ+aLuXIERqV9t0pmMLaWujWGOwhPlVuPLwb6tTr+cKtZYCmOI5WeQYTcQ3l53trbWaJBig
	qLnNKrJimuv5LcBs8Vc/PRsW2I0IDdQI0DMAvliAjTkYoBbDBmTVRRR44wEiAmGIA/PPouM3cSw
	HRYs+e6a/DbPw0M7WuAr8yd0iTGW1+LGtYtckeNvj6g==
X-Received: by 2002:a17:90b:4d09:b0:3a7:9413:cfa3 with SMTP id 98e67ed59e1d1-3a79413ddc3mr6299032a91.55.1791254280387;
        Mon, 05 Oct 2026 19:38:00 -0700 (PDT)
X-Received: by 2002:a17:90b:4d09:b0:3a7:9413:cfa3 with SMTP id 98e67ed59e1d1-3a79413ddc3mr6299010a91.55.1791254279897;
        Mon, 05 Oct 2026 19:37:59 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d2406b1sm1679514a12.8.2026.10.05.19.37.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 19:37:58 -0700 (PDT)
Message-ID: <c8930670-32b1-4f20-af0b-a13d17b45044@redhat.com>
Date: Tue, 6 Oct 2026 12:37:49 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 10/23] KVM: arm64: Consolidate stage2 unmap range into
 kvm_stage2_unmap_range
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-11-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-11-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gWFVW22p8d4A6LXXrabWEm2cX90p1eFwUFO5n8teMQo_1791254281
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> In preparation for adding VM specific backends for stage2 operations,
> nuke __unmap_stage2_range() and fold the logic into
> kvm_stage2_unmap_range(). Also, make kvm_unmap_gfn_range(), the only other
> user of the __unmap_stage2_range() call the kvm_stage2_unmap_range(). Also,
> while at it fix the comment to make it clear that mmu_lock must always be
> held while unmapping. The code already mandates that and the two call paths
> do have the write mmu_lock held.
> 
> Later we would replace the logic in kvm_stage2_unmap_range() with VM
> specific backends.
> 
> No functional changes intended.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Change since v21:
>   - Nuke __unmap_stage2_range and consolidate the stage2_unmap_range logic
>     into kvm_stage2_unmap_range(), in preparation for removing the KVM_PGT_FN()
>     for stage2_unmap
> ---
>   arch/arm64/kvm/mmu.c | 38 ++++++++++++++++----------------------
>   1 file changed, 16 insertions(+), 22 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

