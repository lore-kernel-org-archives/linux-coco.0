Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C7B37B3FE
	for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 05:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789362395; cv=none; b=ndvvH2hqV8We5LZvt9e9jPJZin1VTdedP2MYSkRPb65/+NO7W7NVRAEDCRXejJiYglimfefpPlVIvd2cA405zbbC4To4aCHTF9WQDRTEgM9GcJzRGCwTD5t6cJpa/GMNDq/AbCZPxh6/q8aB0aznrV8R2rxWNYUrVdhmJrom7HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789362395; c=relaxed/simple;
	bh=E9cc/135TTwNgjmAOrXJSDfGY3OksbkbWgtTU95PGtw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nlcxmAZKWCEiqdbqbeG1plqslwQu1DXJ+27XNj7GGSxWkyHYXnTYf5Lp7W/wEYCKRxxX06MP3TCcylKIGDMrNz5+9xs5sKP+tiGWiUeIAQSwfIqg+e2iQNSjwx4c0FE/C0mWuQHBSp0uZkDWBv6gfvazlMsDKg3LfuRMPBsKAG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iebbuoxf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iebbuoxf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789362393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CTGrNcFkd0r7wvxM+LayJdDhB/Bf4MUfRoY837NnKYo=;
	b=iebbuoxfdHNDrRrH+OPJGQsqFSlydKTpVup364qWyXRhkb7X/lCQcO5ar+8YWaXJS2Dh2B
	mur5u1MfPbUYeQTopBYcwH3uFuHjmVSWDMvje8tumZlaO6Juw4AFK8oIUs4IQ9gNRQtoHL
	hnrrK2uHXv4ggbXIlW+osooA/Rto02E=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-rvNLiIjhOlad-Ny9824pdw-1; Mon, 14 Sep 2026 01:06:29 -0400
X-MC-Unique: rvNLiIjhOlad-Ny9824pdw-1
X-Mimecast-MFC-AGG-ID: rvNLiIjhOlad-Ny9824pdw_1789362389
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4c1fc9ceaso2363197a12.3
        for <linux-coco@lists.linux.dev>; Sun, 13 Sep 2026 22:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789362389; x=1789967189;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CTGrNcFkd0r7wvxM+LayJdDhB/Bf4MUfRoY837NnKYo=;
        b=tVKkldvJ7UfrjM0VrtDxKIdRZJKb+XuMaV+9qAhSbs4KRYLXJAcfzI5RAk3TLzmWCM
         RInWMUJGqOKcjphuFDyRQuK6Wl7YAnWESzF+whkXcJFH4t0sZhtmXKpL7MLiezHyw2eu
         jUAMu3hVFY9AOB33Ic84dSumOMTbVwlE5maOKCetcLshs7BRRzPTYJQ6Y2p7DqhYMwDv
         62bqpZ83WCiumDozCo7pam7ZplNyDjIY9Kc4MLx9SIJ52Mi2SL0/J8S28CCY07CN1Q3x
         Cr4zBEr6Zi4BXm9Q2jekl3Huo/f2yFJ2MWtgsmB2uWypmUMp7SdICVeiFlESjgu12yw8
         kiqg==
X-Forwarded-Encrypted: i=1; AKwUvByIa8+lgOMm+TGmmYoO93heUtv/x/nl3oaFcPmb9QDhY/jRHBVs0T85s1vtoEl87MmX80r9cT01Pqz3@lists.linux.dev
X-Gm-Message-State: AFuF++mDR3H9TxGSGIlautjy+amFVTbrkIv10A0N97JPS980jIOvUbWa
	JhDjkM2hd4Ry099i3IpmeDPWcuEaY9xeJ95ephZnjlQv5h6I16yW3HBOSZQ88jNyQvn+Ym+2m94
	+rhaKehFcVn36nbI4t92tZKvwbx6dAW33KXMjdDg3l4Xi5uLTAeXmW56bP9pWoUc=
X-Gm-Gg: AYBFou0C5zkQBzPPlVv3DSNaJe3/SDqyBArNyy0T4REug+MW+ZZ/B2tnq+rys7NsjHO
	5GjJhQLtU7v79XVQvEaSPcKwfHK3i1wdzoTMoPEGoaCBY2bK63J5M0v/t0B3bai3Z/ycxDNt7NQ
	Qb3NY+Q/1w1MW2cH96zDcZwEMBNRjzcEVSfQUPbvGeCuf85JjKFIa9CjyZHdMG9DGYMVVxdBl+m
	b1dR6TCHziI4a8g53VKu1Cb1qY6Ro+4ky30++JYpbT4nTndAuygu+0lArnlu22orCALOjYKXy4O
	t2hV74znHT8FLpco2iyCUVP1mw6986VxrPprYmBoE2VGUkZP6get077tx4mVmFadZkJLOvLk3Ki
	H9xUIugv6IOPFE+upUNiA72//UeCjskoA4X62UQVOAQ==
X-Received: by 2002:a05:6a20:7290:b0:3d1:2dc5:7d37 with SMTP id adf61e73a8af0-3db4039c82cmr2007607637.3.1789362388796;
        Sun, 13 Sep 2026 22:06:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:7290:b0:3d1:2dc5:7d37 with SMTP id adf61e73a8af0-3db4039c82cmr2007526637.3.1789362388369;
        Sun, 13 Sep 2026 22:06:28 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c654b5b0sm4167221a12.13.2026.09.13.22.06.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 22:06:27 -0700 (PDT)
Message-ID: <e15dff15-74d5-459c-98ed-0473a7761c69@redhat.com>
Date: Mon, 14 Sep 2026 15:06:15 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 5/7] firmware: arm_rmm: Activate the RMM
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
 <20260912083611.2513845-6-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260912083611.2513845-6-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2g9HTV0Axh_KrKQVL6NdSZB3D7BzK6AdJuA-oYAC5H0_1789362389
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/12/26 6:36 PM, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> Activate the RMM after the basic configuration. This is a memory transferring,
> stateful operation.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v17:
>   * Inline RMM_ACTIVATE command and remove the definitions from arm-rmi-cmds.h
>   * Use scope-based cleanup to free sro object
> Changes since v16:
>   * Split into a new patch
> ---
>   drivers/firmware/arm_rmm/rmi.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

