Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C002226738B
	for <linux-coco@lists.linux.dev>; Tue,  6 Oct 2026 00:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791246570; cv=none; b=jqRu/0kAv7MweUbNTV3jNtZcCoSN3kxxZzs7OvYIdp+WhBZpyjmp9hKj2CM+/31McZH8uTa5KF2qf11zluBFg5iN5mSeAa89dD2ywtNWf0z4DV7S1Aj341MG3XTtik9aHlGOpO9wDrDLq0Z2XZgiyFfmQeNYim1q/RWsS1y9X0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791246570; c=relaxed/simple;
	bh=Ep/O91QiOVfVW8jwrv1LXJ3OUte/E8KeD2kAa4PCIvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N2Q+813GnH6QQWslXXJkWoxFl6oZhZCSwGrTT0EdS+3NpL3XX18oHFpJUKbDL7QUkCHFwlWRZoFV7FxSrtL9Cmqzle1Z9kqlscC2KH3EU7EwiYhLsfyuK9OAUwF0a0ejr6QhVIKMK32tzBnW7fsTW0GTKAFZpdSjrjeUviwdqwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fImMzWrf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fImMzWrf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791246567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2dKXjEUftIgp77OKHDO3ncsIawS7cJdjkrLy6a3G9XM=;
	b=fImMzWrfRPDUYi8vUiifGzrNs7FTQ9+vj9e7Spnluqfe89jI6CaBRNxHbaltaDV8m696va
	wiQEq0PMvhiH3wAvrtYuKBwy06ileprXBpLPclkPwosZF0FiZ02BnwWATXCaCQavxtoxWc
	jL9f/PwM9vpVFsZ4zc3wBH/BA82g2Ow=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-Ja87u-x8M2Ctcod_QzvAyA-1; Mon, 05 Oct 2026 20:29:24 -0400
X-MC-Unique: Ja87u-x8M2Ctcod_QzvAyA-1
X-Mimecast-MFC-AGG-ID: Ja87u-x8M2Ctcod_QzvAyA_1791246563
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a813204f87so1224621a91.3
        for <linux-coco@lists.linux.dev>; Mon, 05 Oct 2026 17:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791246563; x=1791851363;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2dKXjEUftIgp77OKHDO3ncsIawS7cJdjkrLy6a3G9XM=;
        b=ixN6T9swWIIaCY1b+8L9YM47Ai7CtIYr+BGWeLny9fXtK3lLsdr3jokgFYZ8x8SO79
         XPZG1dAzu4NdnzQB+yvjFoZer4kyagzWqeTh/hp7GLWl5bRLHRsKf7Dq7llTH/Qfx7Qh
         m521QTrK8ySVR4xEsL9+QP7HM3zeYDv9VsW68W2x89buYa2s6vfjsWkne1E35VYaGpYP
         KuLuQtUeRGz82M3fEmkmLlGzorR1m9hQc2wM2G4ifKwir0e8zvoiiIew3ePJwsSdMkzZ
         F1M1cqABrKARbQY/4xsAPK/rcmB+yGy3nv96TZArXCTNThZz03yo8errFE3kHMuuR0w3
         0FUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbf8oDbTMDhdQASZWRsvhaaElrwNJ4cegMt3/0HPCAY3dkXAlqiR3Xi6Rt+vty2h0cZ3JA1rCcT4k4@lists.linux.dev
X-Gm-Message-State: AFq9FYIZbvqtHVjodAmYWYp27lhHEB1CKKeyZ0Uoupq1sBHIG+JBrC7/
	Usze9bqzTCa7mpxV7y6OzvdY+wytiexG2QhwGSfhxN8OXizk32OkYgzl3466KjC/Ki6L6b5rp4O
	ZKFSwU6T6WsgGyxV2d3L5tgTmIWWSBTXUCiC7hQGgG/RDik4HIHahtI05Q/sBuBOkqa+Gkrw=
X-Gm-Gg: AYBFou2ckRbAq2NAIjIVQl3mDUv1ed8la6aIsGMZn9CJquqVrL8HM424rkwqzIPlxdD
	7AgCap96dx0RwxTE7z9zorrBOg5wfGQwTWtHxPYHt8i8ye4fjs0Lsc/3MIC2H/KP8UUJq65Y0gn
	+FTlxLyrUoSfABUbAOwKCL9L3JzAEbBPfiIpFR7ZFbyOAXGreoagaBIZY1FbvFu/oM1XB8aTh7g
	c9xBLRdqNvJxTPrsXcCJi0C540+Y4MS/ivDnxBXwb0GHjFzYw8VBJVC/cKkedtfn90oS2WO7urE
	yNEm0YgfuozYz75HW3yDbT0qSUT2xyIInUeI+a4pXLdB9YFngZNmKAnLjFlAQX38hRSemXRnwGI
	XkffA/OpG67aS9WEhrIxZ24uyx5RNxCXo9LQjEAb0yw==
X-Received: by 2002:a17:90b:164d:b0:3a8:163b:b06b with SMTP id 98e67ed59e1d1-3a8163bb193mr3223747a91.57.1791246563192;
        Mon, 05 Oct 2026 17:29:23 -0700 (PDT)
X-Received: by 2002:a17:90b:164d:b0:3a8:163b:b06b with SMTP id 98e67ed59e1d1-3a8163bb193mr3223706a91.57.1791246562693;
        Mon, 05 Oct 2026 17:29:22 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8533abe0asm1954324a91.1.2026.10.05.17.29.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 17:29:22 -0700 (PDT)
Message-ID: <9536a477-3d66-471b-b58a-b941e4a372fc@redhat.com>
Date: Tue, 6 Oct 2026 10:29:13 +1000
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 06/23] KVM: arm64: Don't call vcpu_set_pauth_traps for
 pKVM host
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
 <20261005090754.2140522-7-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-7-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oHJF_jbEm5YOcLfRehfGoOhpUnUkJ1wivV41HabsGDc_1791246563
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> vcpu_set_pauth_traps() bails out and does nothing for pKVM hosts.
> Clean this up by moving the is_protected_kvm_enabled() check to the
> caller, in preparation for adding VM specific vcpu load/put callbacks.
> 
> While at it, do an early return if the vcpu doesn't have ptrauth.
> 
> No functional changes
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v19:
>   - New patch, since addition of this to the Refactoring patch makes it a bit
>     more bigger and harder to review
> ---
>   arch/arm64/kvm/arm.c | 52 +++++++++++++++++++++++---------------------
>   1 file changed, 27 insertions(+), 25 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

