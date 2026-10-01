Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DF14968EB
	for <linux-coco@lists.linux.dev>; Thu,  1 Oct 2026 13:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790860234; cv=none; b=skROIIh0mVGHYj7a9DvV6xmP5a08G99DlcU5+qVMQJOM4ZC8s3hRTqwRsKAF7kiCOT0ZQVYKrgsL+jlmziOCxwtu7ZWHIK5Xd4G1m8/jwAiFkfvWnUAVP7tWzPL+x2hNzNnb5QkdZxrM47+Rx7SXzwGhFcqQ5ntaXS3FuBaDpjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790860234; c=relaxed/simple;
	bh=LTZ6Km6/CpuoVK8bg9yT3WNGLHdPkHSXQmJ98kg34ZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ghQprZpSHoOTQKAZqhK/kpQt2Mz5NUBWqb0NCe0Xw706S4ZoIItj7oKLgpFsvmwnciA+KE3DXpfgQPgl8kiNy4a4n9wSOEmkmyU+HyS1GPG+ksKnrVoCW1hPUg7aGpt7mUu1q2etDDFL9QO1zh1hkCQogIxL6453o8fUmqMxGhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X7g9fxCm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X7g9fxCm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790860232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DDJyio79knKj0re/byLa1b13NjMEeAfKBhItlxqNUIQ=;
	b=X7g9fxCmycN9dDwdR5nPCfb7lp+/QBFSFekcTr+XJv4bQDRja2hHMUdMUok6UAQP2TuhEr
	BcIOKSaHyGGgW+sj8r1E25iIOVNNo1ab3S0VWL0iwxXDEV4tWAIuFJfvfesnsxNyHifJJc
	enzs25RlCsuLQd9bWNwxj6tfWjc05PU=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-Sj6NaedrMMiySNZi4-M1gQ-1; Thu, 01 Oct 2026 09:10:31 -0400
X-MC-Unique: Sj6NaedrMMiySNZi4-M1gQ-1
X-Mimecast-MFC-AGG-ID: Sj6NaedrMMiySNZi4-M1gQ_1790860230
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a0be20102fso6322871a91.0
        for <linux-coco@lists.linux.dev>; Thu, 01 Oct 2026 06:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790860230; x=1791465030;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DDJyio79knKj0re/byLa1b13NjMEeAfKBhItlxqNUIQ=;
        b=GO3WleJrU2MiL5Lcgcq1WZ194G1uNv0DUsihlY4QrUUVjw2UMePtFN534wytcKwzuS
         WQO7y/9uHReTQ7e2F5e2B0EOGj5aMfL0PdgeeZ/NhJ8pxrtMuI507w8W6XK1aqLPmbPt
         Qsn478UtzbWXEwXtXoNqNap08zF3VkurK6yJFIcxcBlDBUb1mvuqy9NMge+/SA4PWF/z
         eG4hYi3uRP8cgKqHzf+8tlgDncSWgyTYULFLbZlsTDJhEZRXr6Ktw4mX02QEHF3hq3R9
         7Jy7qhsaKIcuuOlEc8GHbn4Hlc6sRi1btDmDa9WZ1HD0zqdxpLs7q+eVUEOR/UgPIDCH
         pkeg==
X-Forwarded-Encrypted: i=1; AKwUvBxuCo+2Rs11Z6CSWz5zmAuPEp6omdJpu8Z2kL+R1nm1gaGoBuyGmFROpzl/DsU2Ws5s/ch2dfmi12KD@lists.linux.dev
X-Gm-Message-State: AFq9FYK4o6ukXCfseylbpb8237/aGBoqe+gjzkI0ktztmaS0V06MnXcb
	Dw5IhIQSP54pz/1PviUyA8xfV9pjNogok2cA9ZiTekRKFKEqbY9SbNmqLxDyR0FzlLISuvRYBnr
	UqEQWePgMIZcEvoKMytxE4Ox6gUqXSEJ/hwNxmOI0ERxG1Wvhuu5vaB2CqTsOwoM=
X-Gm-Gg: AYBFou3cqPjrxkta+xqtVZoM2MSAzkgUqnAeZM5wCKGeh1dmCvEWJkN7PYGvehsEgrV
	RugMiUBKc7MHW/j0vbAowaVYk9fheCD86DGtjpNWiYUQ9GxPbCGMTgHTz52A4o++wbvC3j/vNWK
	jzIZuZyyPaxRgOZqsSepsVmy612jrXZAUtV8xa0F43HdjTEmZy29WXAyAoodzK5V8IpkJYy+JIL
	hCI/4Np56uExRRkXm6GTOvDm2p9eAwG5+PLkWIeHbXxGIRCyQIKFIF8KmALm8hWDe+rcjNMoVzP
	+GOCIPQ4LHbVUjzKCcijfApOYl++0x9++WutDmQxPBCSz1o8crEAJ3IeJsQPIG19RICYndPKRJB
	xnd86gUmMYJSu2rUcPTmT8HeU9BrAZQbrOvvPEUXJZQ==
X-Received: by 2002:a17:90b:4d09:b0:39e:6c69:f472 with SMTP id 98e67ed59e1d1-3a4d18c0f59mr4364899a91.49.1790860229934;
        Thu, 01 Oct 2026 06:10:29 -0700 (PDT)
X-Received: by 2002:a17:90b:4d09:b0:39e:6c69:f472 with SMTP id 98e67ed59e1d1-3a4d18c0f59mr4364841a91.49.1790860229444;
        Thu, 01 Oct 2026 06:10:29 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f6fb6438sm1829850a91.0.2026.10.01.06.10.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 06:10:27 -0700 (PDT)
Message-ID: <79509ef8-6b7b-4499-b2bf-f400b1c197bf@redhat.com>
Date: Thu, 1 Oct 2026 23:10:19 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 9/9] firmware: arm_rmm: hotplug: Skip memory added to
 ZONE_MOVABLE
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com,
 David Hildenbrand <david@kernel.org>
References: <20261001084555.1456543-1-suzuki.poulose@arm.com>
 <20261001084555.1456543-10-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261001084555.1456543-10-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KqPjg2XP6GoPvTUytyvcoxsWTn3h3bJ7MMmoevWiVz4_1790860230
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/1/26 6:45 PM, Suzuki K Poulose wrote:
> If the hotadded memory is in ZONE_MOVABLE, we could allow that to proceed
> without the RMM having fine grained tracking, as we won't allocate pages
> from there for guest-memfd or kernel allocation
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v20:
>   - Use is_zone_movable_page() and only check the start_pfn
> ---
>   drivers/firmware/arm_rmm/rmi.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>

