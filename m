Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906A251AFCD
	for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 22:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790115331; cv=none; b=J5nRsgeYnSdJZKbIDw3Xaer77mvqNJxj6fvmXjt80SDz/d/yLdkDmUuqZdKiOaF2mouGYqIrxYGRHdm69E0CwCWuByKXTH4sjtyEjauRlATLzReWaHy4kltGE8R9K/UBbmcDAp+uYXJVXKSty0Sp3tZLRShA2xH7S+ylPNSCHCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790115331; c=relaxed/simple;
	bh=2I+RK594+7yvlbEyJzoCiZ3ZLN/AQWF6AlkeQkLTv14=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MinEc4DqsNffswKPfRzFpmR3Sa4sh6zeT0S2fF3k/tGOQTgAxPzRJoTdkr1R80KyZWdFTPSrv22j5K7+UsPKLU7xvVo8hSE5AB7kEfKGj9cB2fyVC9T4OsPd1M7jkO6Riouxzc31quhFWvv1vOMUK+A+nI2pIdrgcRIl8xxSEwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LUIg3yqi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AOqdV0h4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LUIg3yqi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AOqdV0h4"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI6wN8178706
	for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 22:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3J+Y3qFDHro/ofj9RaFrKGahhFH3oBBHZcDF842RuqY=; b=LUIg3yqi9TH9y9gg
	F/mIr66JscemBMTu6ta06KCd3tUQmpN94F8XDNu2Egp5ULhY9mPCicRZtFxQgTPd
	HGWoa3EhlM3QVW+9XNz2U1tdp77dEZ64XmmdcwCnIPWNS8kMKkGmaS/Skqccsero
	ZInCQfVzqdZdF6ngjyH+Lsf4v/G0j7PHPaIMQIDuXKK+RYV3dTQ+QE3CsiYEa3b0
	BocityRN+JBLonLjGZKk7WPacf64e9IPfnE9NpzTgFwsb8D0R87Ii7AqmXA78xqy
	6qwoFni+9GOvuAsazk/Dr435tBhsXyyNAEHOW9B54SD34831GriuIr8E0HdmbVGo
	2zdD0w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guuec2bvj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 22:15:16 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3282d5302ffso282641eec.1
        for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 15:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790115316; x=1790720116; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3J+Y3qFDHro/ofj9RaFrKGahhFH3oBBHZcDF842RuqY=;
        b=AOqdV0h4GRT+m9Kb2I3/Vz1AFrmIVMB1jV0a13kxXz1kQ4Q1hn8PpKQr8YWuOLjWeu
         Ys4+9z0Wc/aWehBbgxUymlkx/9TAzVDnuCIaMMoMlcE8cmeR1byHuzF5r2GXyGns0DBj
         0nFQHTKAvERB3mbZqE73IRLCTvs9BrBvkoS//q+xfUDgeEJ+aopjEmS7QsBOZcRu99n/
         lNGK37OJZzVmPk7hUCL4izDrOE4zklvAjwXs18kpaG0aqFyXP6hIai0ojCsaep6WzF4p
         BcHmYGNtNLtEbX1EcbXNTwnoe4LuSC3FqqHBfL6JZSUYQnDprr2JOs8ravr8pxajQ9xc
         /Fag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790115316; x=1790720116;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3J+Y3qFDHro/ofj9RaFrKGahhFH3oBBHZcDF842RuqY=;
        b=mHD7Ofl3YFqL+rDE37pvXSwcsRTB7V8Lolk23HQeQ+CxkMvY18IVG+OQfx09ZZzE8w
         HEyW/tyupbSVl0iGrmeU3krFEMTvCWNWFHph5bUD+U3ZLv6yRNav3UMSHsUnCkNdS898
         bb2UCUvMgCSk+f155nGZqLfEOwyxg5RitsMAm/qFFhRmErOhHhfDpNglKO8UGhhOb/j+
         JY50SdMERMkrAnG4OZrkvz2OCAtIz05asyJB7xEAaT80CFZJ40sOQrsRQ2zOZMPesAmX
         vgNqyh2GHacPDWnr0j7SYpAzv3WB5J1VhOSnzFb+vH1Y3aE3C+eYWfU4LCi20/aHTOLR
         2Xwg==
X-Forwarded-Encrypted: i=1; AKwUvByG/Ah+wd5OWXY2iKuHHBtMAnSbuiLJn9f/igwYOVtth7PmabC1QGdacLGtiSo4oIWZUXdXPfE9JAV3@lists.linux.dev
X-Gm-Message-State: AFuF++nSKeUKTMBH22TtiT+KtX8uE3mG8mWUQw4DC2SEyjSb4VP6CWj3
	UPU+hBjgBLQmaZZwVBd+sC/L6ciJi5Ic8NRBF8qmKu0jZa4WX003c431bmEoAoi5mu7P0dGRA4G
	bHkfqeGPxmwbScn3QZ09dsQ5TqTRF1cBHrSMli8fwZc00ZokE12ogwIEjzYuvWzKLhEXLwoLh
X-Gm-Gg: AYBFou3CIEua/kF+WwraD/IivbI8bgDF2MVGfhkDgiEgK+QWenme/n6rSux141AELhu
	+G7BeqcjAQ+3iUksG4mYOiCIJBcoWWeeZCbGA2/fkg46e8izDH3fjJTnYFFSj8u7BA0ZniIakb2
	eF+4G0QHfO3j4rjecmoRa2gsscMBDHfiGDfMKpKMfovfQz93mj1g4Z45oMsezDyslXwS0mHRGZo
	ptox1LyrIVfQn9lnvKTT1BO5ra2xT6JeCyg7kjnOm6YoKaL7J67T5c9n8ZIFhN35aUDjcfYeEHw
	ZRqHx8hVOj8nOiuD1cJPgUzPbAf2QPvQ/pRIBEQriJjT84Il7GGzTJVQLBBJ3sA+x1VcnxMJYF/
	QZlFwIzfAOH4C10UNDwguX6/tbXvXDZWKbFKUc7eUQuL6KQExYiJb7A==
X-Received: by 2002:a05:7300:e9ce:10b0:33e:6c5a:37c3 with SMTP id 5a478bee46e88-33e6c5a3aeamr850806eec.1.1790115315799;
        Tue, 22 Sep 2026 15:15:15 -0700 (PDT)
X-Received: by 2002:a05:7300:e9ce:10b0:33e:6c5a:37c3 with SMTP id 5a478bee46e88-33e6c5a3aeamr850779eec.1.1790115315280;
        Tue, 22 Sep 2026 15:15:15 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9625825asm1072047eec.13.2026.09.22.15.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:15:14 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:15:10 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
        aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
        joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
        linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
        sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
        WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
        Fuad
 Tabba <fuad.tabba@linux.dev>
Subject: Re: [PATCH v19 08/20] KVM: arm64: Reuse kvm_stage2_unmap_range in
 kvm_unmap_gfn_range
Message-ID: <20260922151510.00003c76@oss.qualcomm.com>
In-Reply-To: <20260920212845.707-9-suzuki.poulose@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-9-suzuki.poulose@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfX6dxaWz3vQYys
 WoNIOA7DtdJjMT1AhxaW2fNoWnnuukrE1FpKwdu0t9VFfpAJny+pxSfF8bD1l+wdWOeiBZFq+Ct
 qsS1eXd3RbTYahEY73lRQGrZpJ2ox4TQN2uXKBNbBw8lvaIR1rNIQl+rAEQgvbm1WEN7cHA2E1P
 pRJyk+SLRN0Mac8aZ63fmomS+ATYu5Hbvt8oelsiD3450MsHC7wfZ19NjVUsiPDkBRBaMZ0qAV/
 lMFNs8jzbYQIvnaadz+SuASeQ2tC8J/ks5XJHrd67a8l80YCFlp8fZnGFssH+BoOajVbHg4U0+g
 ecZB8Gu1kFljil7qtP5oLjtF/+1D8R10YR72SiUo/fn2W0KUTmNxZuZrmgNCx+hyucYr0PFGZEb
 aYOdyix6vv0Ex+r9PcsNoiMGJK0YKITgbYsQd7R8tT5VVph5IKJZP0k6JQQejmmjVHmLRWmbWy3
 R+nbbA+1lKHCueA8zKg==
X-Authority-Analysis: v=2.4 cv=VKdIDNPX c=1 sm=1 tr=0 ts=6ab2fdf4 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=kMqVnm4xDtAkP_aMvZEA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: Q_OTN6xh-rEeBbc8NixV74x2TRsymHCI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMSBTYWx0ZWRfX5BQDFKZrLHUL
 SwFTXIYts4c701Nq24xfimakvP/wQjrUhnor9ChJggKIZ3AMFAcjZmDNY2Kj+tyvMsflGV4xO5r
 FqOCNNDm94+EBAV2pCWx+XvfGWhKT04=
X-Proofpoint-ORIG-GUID: Q_OTN6xh-rEeBbc8NixV74x2TRsymHCI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220301

On Sun, 20 Sep 2026 22:28:33 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> In preparation for adding VM specific backends for stage2 operation,
> switch to kvm_stage2_unmap_range() instead of __unmap_stage2_range()
> from the kvm_unmap_gfn_range(). Drop the bail out check for protected
> VMs and defer that to the one in kvm_stage2_unmap_range(). Later we
> would replace the logic in kvm_stage2_unmap_range() with VM specific
> backends.
> 
> No functional changes intended.
> 
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Trivial thing inline. Otherwise this is fine.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

> ---
>  arch/arm64/kvm/mmu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 0f4e8b71fa85d..03f2017a7404a 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -2436,12 +2436,12 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
>  
>  bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
>  {
> -	if (!kvm->arch.mmu.pgt || kvm_vm_is_protected(kvm))
> +	if (!kvm->arch.mmu.pgt)
>  		return false;
>  
> -	__unmap_stage2_range(&kvm->arch.mmu, range->start << PAGE_SHIFT,
> -			     (range->end - range->start) << PAGE_SHIFT,
> -			     range->may_block);
> +	kvm_stage2_unmap_range(&kvm->arch.mmu, range->start << PAGE_SHIFT,
> +				(range->end - range->start) << PAGE_SHIFT,

Looks like indent is 1 too many space.

> +				range->may_block);
>  
>  	kvm_nested_s2_unmap(kvm, range->may_block);
>  	return false;

