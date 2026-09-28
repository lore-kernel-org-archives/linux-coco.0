Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A8222157B
	for <linux-coco@lists.linux.dev>; Mon, 28 Sep 2026 01:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790557857; cv=none; b=ty7emsh6OueWMUGAZjMTtMWuzUZIHQXPpXEouPp4GupDHuXpZtI2bXetpm2m91z1skqR0w/jcY8uWRKi9cpd+lQP0xuFi5DMd0GbEWXK+ou4L1W4LAoXTz9EdXYy8uNx+RiFwQ733CLmNVwqCNqGejwoyc1uiZLQAPpmHsui/jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790557857; c=relaxed/simple;
	bh=6yMk76KzWzu+iefeI1Jyf4+Me3XfVQPopFewLbvBPhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dnFB1LXtOUbVfptOWDLxjcjqMK+PneKadPw/Mx04qwe5cZuONTExQO/JPjVO92HPnlcaOJ4uVLIjYIek32eYHrSyhX6EcKU9eM9LrLxs7sU6KqOE4hwkQnyf/GBn1jvBggErHjNAvovcAWaqOgNf34YcGpLD+TBV+BD4uh29bns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hhptWLXh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hhptWLXh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790557854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SmHYt1Ti8nIvrqszBUhxBgvTrbJZdy2Ri6tFNNhqhDs=;
	b=hhptWLXhnJ5Lw4Wh5/k3VlbMSWQE+/6vz91PX7av8rbENPC8kee+toZjpUI9+MxUXwt7wC
	4MpXs1nf3DQUdPGmzqkDs8SiZ10kAN/ZvqHwYXunXExx6rADy6SQKRcgBz6nc4i33WTVN2
	gJc7tlvRP2R7Vh1zCCBB30TI7pfVJ/s=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-GUaX57ZNPlSK6ccehTLmPw-1; Sun, 27 Sep 2026 21:10:52 -0400
X-MC-Unique: GUaX57ZNPlSK6ccehTLmPw-1
X-Mimecast-MFC-AGG-ID: GUaX57ZNPlSK6ccehTLmPw_1790557851
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso17578815ad.0
        for <linux-coco@lists.linux.dev>; Sun, 27 Sep 2026 18:10:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790557851; x=1791162651;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SmHYt1Ti8nIvrqszBUhxBgvTrbJZdy2Ri6tFNNhqhDs=;
        b=YBQATPu7mqSK7532qGjre8YC/kvC0Dtarvrsif9qfBNnibCiEm0C6NEzKyxlMBSx7g
         Nke6zVNkH75iRZ8amHpO86U6Aw1H2f0h8o0aaLKU7kK+szsB+nTS2iGksWJmyh6HLnQ1
         cFbPjjM2OHbvDn9oDg1kxDWiBDt5O/SYlhbno07rGe8tFa6NjiFfEjGHzYs87sN9TniH
         UrIVWmluLX1HGiee0cIv4IpEUddhf0u4dnIs/fcQNo0S7WxcZVqRb6Myo+myjW2fR6LS
         mZo3Q3ylcJ2HaUOyXOWIjkBN135m6TuOgwoET2IaoK/jJv0tedRkApt7itp7PwiRfBxv
         JJCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIK1l1MfWK4TfK+adwSb/WRxSYELFH2SR2IVMsGcNZi1Ij2FFLejqrDpo/lmSwvf+mbN2vlXncsB2j@lists.linux.dev
X-Gm-Message-State: AFq9FYI42LOfM+FJdyWOjgmLtBIDA8GrYagTeFtnMIb/CCmqJzLD0YRk
	YuzALfBVk8I1Mq5KVW+ecJZqksWKgp3TYl634QwDWjWZWAEaSyNsRswLcqBoeFPr2HgK9eFjVZu
	x0ColyctocLsL351h+G8DCHJmOHKvcetAZl75Dtw8f3Qw6adY92KG5v3fukD7lWU=
X-Gm-Gg: AYBFou3TY6SGk8nz3Fb1iDPYLdY1vxqAQNgoyPiHmeJ3y42yBtoiGNxyy70yTEF3BDV
	sfjOtPaylWfD3E8o3MWUL01oyVJB7BKhxuHlyrRqxpY5CAyiZhgvnuPYYfRLaBREC4YTdCdgiej
	RSTVh9QGvE13cc1FTqkv+/S169orVJxF6V5xjywZuOEjnU5VkIUqJ+ZwQlxj6hN9lhGsgm4nMEG
	jx8KHBbTbz9jLmZpxFbDzPTbM+PuCEMnmhsUAw8L3Xxf1KP2nkSCqV0/o9fJY1Lf9FSoLiG5Ri3
	8ZGLE/hyjwZ+gBIzv8XHekzReWabz+6Eo9nGuvrBHdIjKLsree7EtK+KpWVgNYJIeiOj8DmNHqv
	ryfUO/l2bV+0ix27zmSCPZK9exYIIMVVGOysF7ltFmQ==
X-Received: by 2002:a17:902:d2c2:b0:2df:4862:6092 with SMTP id d9443c01a7336-2df7dc52ademr80473285ad.56.1790557851441;
        Sun, 27 Sep 2026 18:10:51 -0700 (PDT)
X-Received: by 2002:a17:902:d2c2:b0:2df:4862:6092 with SMTP id d9443c01a7336-2df7dc52ademr80473175ad.56.1790557850985;
        Sun, 27 Sep 2026 18:10:50 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91476bb4sm32933225ad.83.2026.09.27.18.10.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 18:10:50 -0700 (PDT)
Message-ID: <a4961d90-42ef-4954-beb5-c07fa1d92fd4@redhat.com>
Date: Mon, 28 Sep 2026 11:10:43 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 11/20] KVM: arm64: Mandate VGIC v3 for for VMs running
 on hyp that don't trust the host
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260920212845.707-1-suzuki.poulose@arm.com>
 <20260920212845.707-12-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260920212845.707-12-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ha5QJFa_ChaaWBn3ChYRjsLFy6iiuhQUWDNE_aU4YyY_1790557851
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/21/26 7:28 AM, Suzuki K Poulose wrote:
> pKVM and RMM, both do not trust the host. Add a helper to detect the VMs
> that have "distrusting" hyp. Use this for blocking ioremap of vgic-v2 into
> stage2 and prevent creation of VGIC other than v3.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v18:
>   - Cover pKVM guests for VGIC v3 mandate.
>   - Merge the VGIC mandate check in here.
> ---
>   arch/arm64/include/asm/kvm_host.h | 3 +++
>   arch/arm64/kvm/mmu.c              | 2 +-
>   arch/arm64/kvm/vgic/vgic-init.c   | 2 ++
>   3 files changed, 6 insertions(+), 1 deletion(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>

