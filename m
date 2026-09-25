Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E55286A4
	for <linux-coco@lists.linux.dev>; Fri, 25 Sep 2026 00:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790294623; cv=none; b=Qd9w45bQomxpYQu0jsEh8xkuZXqyFE0NfK17O2IS/qc2Aw5KP8TcYLg51qVYddOw236JYlqUvzMkoV5EBaqIAgUXTmsKNMGXeFlcU37DLUV+ERXC0IB3zLyrdip2YkhN6Gd4IaEtyw9S9cpSr/20TP8r1k7oixukPKpcgxywyY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790294623; c=relaxed/simple;
	bh=58hYY3yihzi3KN5FnXcSkwBcSphKQIyF6se4Nsd8i3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aURNRKUKR9b/XRWvGTUTS1RO6FqRYeLmXBNf138uzbkzDupi2qyoNfiqv6EriqaRMjcoVLQtq1UiGXDnBYZG3AHrTsoCsvSFEii6xdo//MmLmrbP0eC2aBqNIvSguCVWloNBEsOP7yumXbwul4VeL4z560r1r/QFF5jauzORtp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fzsl40gz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fzsl40gz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790294619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hwFdRAn9knyJ21BVNTcGe7areSLJLdB+xLeTWdZf3T4=;
	b=fzsl40gzpR4agNfy2jv1I51KxzJB/tobeZo71jseE0i9X1skp1n6VGxlDpBUsJNEK6m/HS
	/MgZJ6DR9+rlQPc5/R7z0+q7yfTfb10GINk/rQTVvjeBP+KJzVdXEGAo93L3Vo7lBWOxjO
	0Rk79IvOmhZCKOKRltufwHi+Il+te6s=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-QVgjj6qBNcCbT1r_w67ojA-1; Thu, 24 Sep 2026 20:03:38 -0400
X-MC-Unique: QVgjj6qBNcCbT1r_w67ojA-1
X-Mimecast-MFC-AGG-ID: QVgjj6qBNcCbT1r_w67ojA_1790294617
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39e3f521346so397258a91.0
        for <linux-coco@lists.linux.dev>; Thu, 24 Sep 2026 17:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790294617; x=1790899417;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hwFdRAn9knyJ21BVNTcGe7areSLJLdB+xLeTWdZf3T4=;
        b=z/k+BtL7N6vSiqkFCAT7bkZ1GSJp5WbGiZgGsQPRwB6lk8deNWX2mLODv83xBsRpci
         5jxIw5F1blBFfUDP6Blc15yDFQWO2dP12bo53gUzg4seRO+OFb529cH3mv89fhRLlZnO
         Ox3KsnTACQsLeGf/UshDTwuPWrSjdOFc+tCgytD+kRNtBOcTJgdoIMA3Dz6q/5LxxDK9
         HrZSfTIN7hJmn8akT3itqQ8NL7+4SegYqsRQL2hyql6ArI0pqLQSDe5K/WwGaPzLqnfI
         /TX64j3HSvH1UGTN96aiwXuWDpW6whOXZ4aKKq39ZzbGdkG8Y9F/Y2PAWQL40Kd0HZrK
         X1FQ==
X-Forwarded-Encrypted: i=1; AKwUvByXjEE/y3aIIGte2JKsK4tMDiIr2mh/yugxOsXr4TmK/T7+cO+Rtqu4be5oiUck4szp+AChKvrDtWwl@lists.linux.dev
X-Gm-Message-State: AFuF++kJOq4OwU41+vM/x/qzYtVKXxbqw6H2z3n1YKDvLsRTJwrWsztz
	FljStL3+cW7PWcL/Alg17T2oB91gVOGaBS6hPJcX5Y1Wufi4EJJRdyD2yom/aP9f5HQotRwIJo3
	BOMIc6feCl6cb7FxhKqaMAdNyheUPIng+XwLaCS9aTSn9gKjncEm4KnPQgCA63qk=
X-Gm-Gg: AYBFou0IV1ud6581GZ521z1E8prXzd3cwwhGttFtNsr0goNL9rgLsSWNIDYu5jIApup
	23uH6Do2CgfaoDZ6Q1xmGl3dbX/tuM3U7xxtf21lkcWpR7CF7pbqI31arx80EWyP378KJS/UcFJ
	GLUJiV0L4yJWoToQ3AE5MSTvKGNIzFegbPybU7h2S0BVHBefTuVv3BHr3M1s3FN5ZQnFhXR+tDM
	T0syg9Sn/j8rWsZJFavkSQVreO+R51s5cTvNH9zp36yrbH6E5PS1cP3spsxbJF+ilv/xKQdi1ca
	o+UV9CNib7XtwEzjpwb8afEDxcsTzdCpgrIpeF6uUJYOaCeYYXdHydksTKXKBkKCClmLk/FACtt
	QB/xPk4orlxcB4KHkeHteCQTej47AO8lDCcR9U6mH6w==
X-Received: by 2002:a17:90b:4a50:b0:3a0:bdd8:fb11 with SMTP id 98e67ed59e1d1-3a0bdd8ff40mr225068a91.66.1790294616823;
        Thu, 24 Sep 2026 17:03:36 -0700 (PDT)
X-Received: by 2002:a17:90b:4a50:b0:3a0:bdd8:fb11 with SMTP id 98e67ed59e1d1-3a0bdd8ff40mr225029a91.66.1790294616280;
        Thu, 24 Sep 2026 17:03:36 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976c8f8dsm7318263a91.12.2026.09.24.17.03.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 17:03:34 -0700 (PDT)
Message-ID: <cd2d60d7-fd6a-4f61-ac94-2190d364229b@redhat.com>
Date: Fri, 25 Sep 2026 10:03:26 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 3/7] firmware: arm_rmm: Configure the RMM with the
 host's page size
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
References: <20260924135201.850038-1-suzuki.poulose@arm.com>
 <20260924135201.850038-4-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260924135201.850038-4-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3aGUXb-oQALpG18UlBupgNvUh5MJlZyaP3NYEFiNXTw_1790294617
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/24/26 11:51 PM, Suzuki K Poulose wrote:
> RMM v2.0 brings the ability to set the RMM's granule size. Check the
> feature registers and configure the RMM so that it matches the host's
> page size. This means that operations can be done with a granularity
> equal to PAGE_SIZE.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   Changes since v18:
>    * Move the rmi_config_set closer to rmi_configure, drop the comment
>    * Use __free() magic for rmm_config object
>   Changes since v17:
>    * Move rmi_config_set() out of the header file.
>    * Print the error message for rmi_config_set if it fails
>   Changes since v15:
>    * Actually check the feature register for the host's page-size support.
>   Changes since v14:
>    * Move the implementation into drivers/firmware/arm_rmm.
>   Changes since v13:
>    * Moved out of KVM.
> ---
>   drivers/firmware/arm_rmm/rmi.c | 70 ++++++++++++++++++++++++++++++++++
>   1 file changed, 70 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

