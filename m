Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35164A2A61
	for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 19:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790105153; cv=none; b=s2/3T2CtkNVFVYw3hAMc5ogBthA8meZ0aX9abmAiODvNUtosiLurFU+P7/D95cuFiI9OHIlEX6AHienIMrFn4UH3PgU57hiXwr/MVhCwYJAh1Y1qdcLlQNW1WrFEnIB06Epvi3IeKbl6PGxBis3baSW7h/z4LnlE1JoQOJVQAD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790105153; c=relaxed/simple;
	bh=r98Q+kuvWzjCrx/8WWgWEzee71wpL1zD1M5HxGJqpjg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fdKDbCNceI6TA9mUPZvbRZxHJ1HciGVOYuO3GMcozHp1aB1CnmW5rI2AMLi+zhPHL6bYS/Mo7BbcDOpt39i0u+J1RC67LSxMKBKfAUA8t6TfYjEgPc48LPqO1PMZudbrLLYTj1JoFWZ9dMgw5AS3EdSfZRAwlxpr2tqvoQTzD4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CbrcBypn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TN8+cisy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CbrcBypn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TN8+cisy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7SIu900491
	for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 19:25:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DpoZFkZdgs13xlkwMgnRw9MvGQ+ZQQ9iQmjkSWg2E4Q=; b=CbrcBypnVrO/fN+p
	CnXEsVZ6d9JTGpgRxJYCZkWWs7XrdTX3I3rFbDICopGo27Y9blozFkSFlYMAI3Rm
	pt+pa5m8ThJ0Dhp6hqxEJTUfTBbxHyHA/VDlbGsskz9u83yI4UMBBANB4DfZGDwf
	9CstNdBXE161t5jy06BnGL5uerZpZIHylqNk6EmwftpvsnkT6KIZwZlAgpXPCZ6N
	t9Tg9HmwaPw5q36tD5dkFbNWFOsOOUClaKAqc6n/DNVgWDpvxiuQSnvJ67n7Xsnf
	NWlCqM0E+561Lathorab64INAqC3bhnfN19mZq/P2as00f1nTWIYGXOYIEwLFI5T
	wdz0tw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gunjyu89b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 19:25:48 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-32850005b6bso163779eec.0
        for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 12:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790105147; x=1790709947; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DpoZFkZdgs13xlkwMgnRw9MvGQ+ZQQ9iQmjkSWg2E4Q=;
        b=TN8+cisyMbVeKDqX/scaO/MIqp9UrkTPSCq3LK5kfgYeQaX3h6vJXmftovKRi8o7Uz
         mUBJWz0dtyDsmuDpvXAV4s16p31cqp43wKgSZI5nTdmHEuZ94SwHybYnhtlehYi0GqWW
         L61m7aQM0yW9fF+rfoONyDq8YqS+P51dA8V4p4VV6AJ4MTzJj5hQ7nvOytAxPSxiciOS
         lMSP2plPQEtWbpJpNKRp0d4F3ej1C7tbNtmmI8oHT/HQ2cUjXsNhWhNKkDuiEuZF56/Q
         ce5eYJum2VQL3w5hwDgUoh0+pUsndaqpS/YGrTm6n4uZDUhrGEypET8lYrX1VZ2Xm1tn
         LYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790105147; x=1790709947;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DpoZFkZdgs13xlkwMgnRw9MvGQ+ZQQ9iQmjkSWg2E4Q=;
        b=usDAR+ylFVaXQdvOet7km5o8uplymoImTzeRkTe+DAmok7jFYMXlWTTR+P3jV3zaPM
         wNuDmZj5MHdEJQfPlYE0JTrcM/mBAMH0KPfg8E4uY+YH6QUjrRaZz5KxsD91rKJuuPpF
         gBUBdy9n0CPkiB5la/aPOhVvH+SpV9qkY41iIjs6hPzwSOp2MPlECxY8I+1CzGY2SBiu
         p+fYtrTd07gRROeLbjTefehIakHAFBNIn7wX2IExFiMf2XgB4cXqid5UI9wNd6g8KVoT
         X7RJczRbWdDf5Gu5BTYPmRo+dMIb/Q2TWTMalsfGP2HJ0PyMQ+/BtyttVFo4T4F4naQd
         7dpA==
X-Forwarded-Encrypted: i=1; AKwUvBwcJJBFxoXPihFd0iZnAPq9ICXiuhWS4v9Otq/tIqzp1bk4AJlS1utyDo+R9Uz32A/QbeYP8luSydbT@lists.linux.dev
X-Gm-Message-State: AFuF++nb1THo97SoXq/HpW2yU/K2M7fN4gN2gQH9WtoH7EIpcSRbdPSZ
	5R1mUA9y9qcUeeCqYZOW3VKw1itjku6Cpdl5Pm0HQG9vW8ovT9vRnLDJpRkZCGGVX07KQWObUct
	ka9lNCrs2pFyEbQ2FnqAJAwa8/7c79EMp2lYwAijGlZszk0RXWnx9LqzhXFddmGvR
X-Gm-Gg: AYBFou3voyWGxh5ZRZBa0DuhR6+RQ79PUfEGXGUtUDDbsZ3P1g7JpOvORDSHpF9CKSj
	w4zQmxow9Qm0W4ySjMcoPzUmzJ7I2MCzSMBjaE9azCngUFqLiclPdE4j/i0PfvDTJEKKNVNMmzW
	LJNipyy/ViNECU+BtiIT3WA76Z1VnAas2YrFtgjJC7AW76UTMNbXUvppXxtwGAWgwiIUv5fnFxQ
	5c6EcPoeA2gHHTs9xdrjnUs9sV31Numrn8UlCw9MW81QD/S/OG7nOzoulo8VP90OyZr8G4afTWA
	NB7rETe/OZJrBUl1fCxz9JHTD7ybPG2xvCnvFNzxijabxpWPsUCc6BhEnbrgoyHRx14Fejf4cn9
	kM3ZBnEnoWog9z2VGJ4x8kzI862pK4ZglsQzh5H1JFd0pVYkvBfewXg==
X-Received: by 2002:a05:7300:fb0a:b0:339:66ff:51b3 with SMTP id 5a478bee46e88-33e8e2b67b8mr229569eec.37.1790105147337;
        Tue, 22 Sep 2026 12:25:47 -0700 (PDT)
X-Received: by 2002:a05:7300:fb0a:b0:339:66ff:51b3 with SMTP id 5a478bee46e88-33e8e2b67b8mr229545eec.37.1790105146727;
        Tue, 22 Sep 2026 12:25:46 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96e48e3esm357539eec.26.2026.09.22.12.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 12:25:46 -0700 (PDT)
Date: Tue, 22 Sep 2026 12:25:42 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
        aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
        joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
        linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
        sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
        WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v19 01/20] KVM: arm64: protected VM: Handle user writes
 to CNTVCT_EL0/CNTPCT_EL0
Message-ID: <20260922122542.00006868@oss.qualcomm.com>
In-Reply-To: <20260920212845.707-2-suzuki.poulose@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-2-suzuki.poulose@arm.com>
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
X-Proofpoint-GUID: e1pIvpjgb2PqWXFnA_6tqTdq064bIR_J
X-Authority-Analysis: v=2.4 cv=KqHYSmWN c=1 sm=1 tr=0 ts=6ab2d63c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=wrk9ooTvwJDonXvhXhMA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI4NSBTYWx0ZWRfX00VpaboQ8CFx
 jhrkcJ5e8qlAl31wWhfxlSYdj0MINcomnZnevDa7e3BczeTyEHzysAX0sWptLWDIlvUCJCmZWHo
 a9zcxaIDt5kdLBW82N7Mv3qDcT7Ec5OmOaX4gtc6dBFBR0fUnHXIP7L5iniYAq9XMtBFqju8cVO
 ulz3zJdMfKXdFkiMYUFHq1siFZ75Tqi3eDO9RZLRSphUgrOVlBpjggc5qkoeiNai+p5Jwqo4GVk
 izIew+hiVs3m7gSI9gVc2fP2wDSMyrIZIR+njrgG5YCylO6lOi0uXZmu+5ZFUbd+lKMlMk1tosn
 FTlSG2z+/v7PCypjnOA/F6khl8WPjJ72JoousjmIoe4sa35mAHW/i+CT6tQlhUkHtp2K1GTPaow
 J0Yi1Cnbl6VfYCfGK9+AIzapv44vrdKOWsk+IC5XKWBEApW/xXjYyJ8BQczIYbgfcQ6kP3cSko+
 ebifNrIoX/yNVCUtu3Q==
X-Proofpoint-ORIG-GUID: e1pIvpjgb2PqWXFnA_6tqTdq064bIR_J
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI4NSBTYWx0ZWRfX7LQ2S8fCsQty
 81047FR4a4moKvEIbLTbxhDJ4/1oyZqv+jm+Y2fn+mM7EstSXSt5pCEFhF6Q07H1+eMMfTLxJW/
 NZJ6tkuTnLdzalTvkbT1wF7Geojx1DE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220285

On Sun, 20 Sep 2026 22:28:26 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

Hi Suzuki,

> Protected VMs doesn't allow setting offsets for virtual and phyiscal

physical

> counters, as the offset is always fixed to 0. The VM ioclt is filtered

ioctl

> out based on the cap. However we don't prevent the userspace from trying
> to write to the CNTVCT/CNTPCT registers. This would lead to KVM triggering
> a WARN() in timer_set_offset() as the vm_offset pointer is set to NULL.
> 
> Fix this by always "fixing" the timer offsets to 0 and marking that the
> timer offset is set in the kvm->arch.flags at KVM init time for protected
> VMs. A userspace writing to the CNT*CT_EL0 would observe success, without
> any real effect. This was chosen over preventing the writes to these
> registers and returning -EPERM.

Why?  I don't mind the decision but telling us what was chosen is something
we can see in the code - patch description should give us the stuff we
can't see.

One comment on the comment below.  
> 
> Reported by Sashiko
> 
> Link: https://lore.kernel.org/all/20260908164641.416911F00A3A@smtp.kernel.org
> Fixes: f7d05ee84a6a ("KVM: arm64: Prevent host from managing timer offsets for protected VMs")
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v18:
>  - Retain NULL vm_offset for protected VMs to avoid host tampering with the
>    offset.
>  - Moved the flag setting into kvm_timer_init_vm(), where it should have been
>    in the first place
> ---
>  arch/arm64/kvm/arch_timer.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
> index 6ac3321f4c575..226cd5a495c8b 100644
> --- a/arch/arm64/kvm/arch_timer.c
> +++ b/arch/arm64/kvm/arch_timer.c
> @@ -1110,8 +1110,7 @@ void kvm_timer_vcpu_init(struct kvm_vcpu *vcpu)
>  		timer_context_init(vcpu, i);
>  
>  	/* Synchronize offsets across timers of a VM if not already provided */
> -	if (!vcpu_is_protected(vcpu) &&
> -	    !test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags)) {
> +	if (!test_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &vcpu->kvm->arch.flags)) {
>  		timer_set_offset(vcpu_vtimer(vcpu), kvm_phys_timer_read());
>  		timer_set_offset(vcpu_ptimer(vcpu), 0);
>  	}
> @@ -1133,6 +1132,15 @@ void kvm_timer_init_vm(struct kvm *kvm)
>  	 */
>  	for (int i = 0; i < NR_KVM_TIMERS; i++)
>  		kvm->arch.timer_data.ppi[i] = get_vgic_ppi(kvm, default_ppi[i]);
> +
> +	/*
> +	 * Protected VMs don't allow any offset being set from userspace,
> +	 * either set via writes to the counters or using the dedicated
This sentence confused me.  Second clause isn't obviously the ways that
are being blocked. Maybe shorten to:

	Protected VMs don't allow the offset to be set from userspace,
	whether via writes to the counters or the dedicated ioctl.

> +	 * ioctl. Pretend the offset has already been set and rely on the
> +	 * default offset being 0.
> +	 */
> +	if (kvm_vm_is_protected(kvm))
> +		set_bit(KVM_ARCH_FLAG_VM_COUNTER_OFFSET, &kvm->arch.flags);
>  }
>  
>  void kvm_timer_cpu_up(void)

