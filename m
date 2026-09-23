Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E0A556BB4
	for <linux-coco@lists.linux.dev>; Wed, 23 Sep 2026 16:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790182493; cv=none; b=YBzyiCGXn/fjBtvLF5ZmtPeOYVP/4VVq04XvS4rOktsZwFyGO5hTemOzIy084sN/Mf7P/lq7lNf91dqOBJR6pqNrDnw7HE8l+PC+4QWANnRXH+sjy8pCYbX34ArmkerNQBqfpEPWJI+hkvrxIWIcluxbPAj3sfqNVGEpc9Z4inc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790182493; c=relaxed/simple;
	bh=VrlzXIxy8Fp+qeOGPoQZqyU4YzmW9HF543x3NzyMjfA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=etOsszq/Mv8OEkwoRs9KoE+0PRC4kMvVMQnfk5G94NsHu2vWMaffRjxOAMstJ7P0qDZHdzmnO/Hr3wTq9W7VPGAbPCmNcyOiz4Vin1FDCujO9WkM07zdwDgq4rRYsbjnBCzrSBy92n7+ct2g6kifkIMAIqKIjhCqJ93YaXugVSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Seum9zPq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dfae8/xH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Seum9zPq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dfae8/xH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGTilo3798615
	for <linux-coco@lists.linux.dev>; Wed, 23 Sep 2026 16:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zlDwEtbUvjpRubwATEGCqUpsne2yYQHkp6iqY3VINLE=; b=Seum9zPqFF1bAFs9
	2SAgWuOtEzV4WMAmZskMjMP9xFgcocCq5t/P4Btc3uXm/yPP+5dFmh5MvrsC6Woe
	cL0t9T8Uk0hJD7dxIFSFHKlwoz8kF0IlCF4G+vCAYHnQ5iI/2KTdeJcGSx2awi+g
	zRh0sCoZKCovDiw8hhNMIlveeyEBS1Vj1OLdNgsBWkZcIG4Bx1Im5Y0tYnE2BZgY
	80heXHTTt8VxnPYBz3mzkSgrfEctt7TgufuAh5IddJeFRDHIZOHddDlWhucY9Wj/
	WeQF9cQwlA6a6DWFbbrnt6l8QhQDXPVALVsLhoBblQDFI7hp0SxbGW7fL6jVBLnP
	KHIFfw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvhsb0928-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-coco@lists.linux.dev>; Wed, 23 Sep 2026 16:54:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d94f086fedso10747195ad.1
        for <linux-coco@lists.linux.dev>; Wed, 23 Sep 2026 09:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790182489; x=1790787289; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zlDwEtbUvjpRubwATEGCqUpsne2yYQHkp6iqY3VINLE=;
        b=dfae8/xHEtXBlV1q+JYLbS7guFqigXImSb29vRsgk84vdb0dDif7v42J0dUTJ+1aEq
         agfzSUxuqUYVUmb3QNkeJH/12lWuzu1wH+D3YlQwicap9fJCR0i/d2vTUOCofHuJpM+b
         3g4ZNdVrfJeqJSiGLX7KwYfM9P8mhF0XX0yJbY1yhEq3sa4kJmQvyX1Pphy4gF8zB+tg
         n2+Pf9KFmyMmYdOW69etacRpmVAO3zPRwDpRtTA4B5b+q/MXKoiu3g/zdMHsmDHnNI37
         PoCWCg4CSMvYSvNVoUl7VwbDbeegeLPymfZFK0Sqe22sEwQVzxTHDbC3ZAiOnTE+pnFA
         YnTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790182489; x=1790787289;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zlDwEtbUvjpRubwATEGCqUpsne2yYQHkp6iqY3VINLE=;
        b=HCsASK4T/TGN3vxOeWP44+QR1ffQHwqQqqsr0BQMtgXEAf7liqTYEy+Dt+OuLURyDI
         Bz1JUaSpTqWHOs4QrHdsYRXOr4SjVJ2bKoJx3LmgiUVWK8OsaSz1opugBCAdD6QQSYXy
         afWD8dSVwo7yPSjjnnLIYlQInQH2n/CGITnVHJkt7gE89NccY6cAuZVXhqqpMBJUhe82
         vur2ad6L/znpfNlY3NbwrVKAtkNw60nnhPQBki42SbNKbLETZvZgj7XKxEgr3/aKyUm3
         Z+nU2e2r+jc3B5zDcuoeAqw9OOciGNC4Mw/jlTqaBtYl4lJWeAtdqZYz8XIc4iXzYRv5
         MPtQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvq/p1t/NDTvekrb/+8WIWDugzmc2hyj8aJR/CeAQHPxJdi+tO8xFQSxZ2ie6yFMJiTAalPnU4EjcP@lists.linux.dev
X-Gm-Message-State: AFuF++n5y+ztVS9uCu5dtwurP4QB9muq9vX4KvlDyRzsfFReMVZShlEw
	NNjRNUCiaX8TWYhe7ijmKhOhXJq214QV/wpHNab178oXv39s3OxizXH6/5mpp6TpXxxVAotlk7S
	r9t7Q/AuI+g+6hY7xjFYhpNuC1Fm3M4Btu1SyjZrIRdAZJkEEc997oWXIsDuliiff
X-Gm-Gg: AYBFou1/Or7EFNUbHIaRryAlA5HwlmBsC5Y48cFcEC1SOXbHCgtISGzrErWha+qJ9El
	4lbzqkL9Pv8IJWvHOG34sOatE1kphY+klW58yabGOaFf4j74hzsNtFe7D2xDoSK9EAwgcYF7ab6
	HehPyCcV4yS2c6Nu/hb3zVK62LHWfA3JLXld1pcenFeycRgkAkWtqNvo37TsSku3k6nC2w08Zy0
	Ew/DtdhBGk9bl6vt6z9YyFN7ILakevMxXfY2Nc0H5ZrSyVCTsS/5K1oXXATpY64QjY2tppYYhBQ
	iVMOJQ8+ypZZ3pU9dkMO3J/BhY7Tthyq23b5XnVbYvNsI0pGthee8Z/Wp2/5ogHMgEwTYcgktdM
	V2tkmRPF6YE1s3xVOQ88E44TA3BGndWabCUIlDIPj3RBE5dt1Vb98ql25crKxTba41A==
X-Received: by 2002:a17:902:f549:b0:2da:eb8f:b4e4 with SMTP id d9443c01a7336-2df69d261dfmr29630395ad.7.1790182489375;
        Wed, 23 Sep 2026 09:54:49 -0700 (PDT)
X-Received: by 2002:a17:902:f549:b0:2da:eb8f:b4e4 with SMTP id d9443c01a7336-2df69d261dfmr29630075ad.7.1790182488834;
        Wed, 23 Sep 2026 09:54:48 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5f4219sm14535985ad.68.2026.09.23.09.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:54:48 -0700 (PDT)
Date: Wed, 23 Sep 2026 09:54:43 -0700
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
Subject: Re: [PATCH v19 09/20] KVM: arm64: Add VM specific callback for S2
 MMU operations
Message-ID: <20260923095443.0000378c@oss.qualcomm.com>
In-Reply-To: <0d5201f0-359e-4748-92da-946dedf51bcf@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-10-suzuki.poulose@arm.com>
	<20260922152914.00001221@oss.qualcomm.com>
	<0d5201f0-359e-4748-92da-946dedf51bcf@arm.com>
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
X-Proofpoint-GUID: r3j-TBSEfL4de4Z8N_JfvysgqhAfspWi
X-Proofpoint-ORIG-GUID: r3j-TBSEfL4de4Z8N_JfvysgqhAfspWi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2NyBTYWx0ZWRfX/iXkM+6v+STU
 z/oZjBkx/bsSmVdq0Bs98M8eY7Rpu/QwKp+wWxfbAyi9sWcrhJg7yRsmCuoZMGcNHzhEyvsYvAp
 jfq4W/ic5OuG6yut+lKigu4x9LxejLisLFmUEfZ3kkxg5NZUY6egZuSWazMb69ZAOusl+uOqP8E
 9WdtaP6mVy0ebfnKN3vADT6ydgOeVp7eflXFGibhMy5//3hyRNMesS4jv8dPC+MoTbwdUI/Og+4
 RBAco52LGqRp7KUreudNR8oTO313pC0/tYDW+Yv4mlUe6gPULwFqHMAh3GJLkYVEcNUnx9DpWTF
 xN/2LBYIpW8G4OSd4nJPHclduTbnpN8MMStvx0/90BL0apZUa3QR3UnL0xwSdpW/tzgQ+YS1LEE
 gDbSXwoMeGKpYpoqTJnFH6aNPd42eCeA2wgnrIiSibUl2Y9X1xmdfStaRf2gKGchI6qUUVb+ifd
 aqdfYVjPmGzyWgoOQZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2NyBTYWx0ZWRfXw5ZjPYOSBmgI
 WOQl6jtYmPHIbbc/a5Py54lO2acs573uvwFSBNBQTZN4SZGD+uSDEk+uOoiHXJWYr98nzn8RKM1
 uibCDjAyrEaAYgfkZgTRQ+nBacHZu8Q=
X-Authority-Analysis: v=2.4 cv=f7vdl+yM c=1 sm=1 tr=0 ts=6ab4045a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=OqzaOk1-375Rtnrp2FUA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230067

On Wed, 23 Sep 2026 00:21:58 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> On 22/09/2026 23:29, Jonathan Cameron wrote:
> > On Sun, 20 Sep 2026 22:28:34 +0100
> > Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
> >   
> >> Add VM type specific S2 MMU operation backends which can be initialized per
> >> VM flavor, to keep the handling cleaner.
> >>
> >> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>  
> > 
> > A small suggestion inline that makes it explicit when there isn't
> > range operation and a full flush of tlb is needed.
> > 
> > I don't mind either way, but thought I'd mention it anyway in case
> > you hadn't already dismissed it.
> > 
> > Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> > 
> >   
> >> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> >> index 03f2017a7404a..d97a4a1bca23f 100644
> >> --- a/arch/arm64/kvm/mmu.c
> >> +++ b/arch/arm64/kvm/mmu.c
> >> @@ -37,6 +37,8 @@ static unsigned long __ro_after_init io_map_base;
> >>   
> >>   #define KVM_PGT_FN(fn)		(!is_protected_kvm_enabled() ? fn : p ## fn)
> >>     
> >   
> >>   /**
> >>    * kvm_arch_flush_remote_tlbs() - flush all VM TLB entries for v7/8
> >>    * @kvm:	pointer to kvm structure.
> >> @@ -174,26 +188,36 @@ static bool memslot_is_logging(struct kvm_memory_slot *memslot)
> >>    */
> >>   int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
> >>   {
> >> -	if (is_protected_kvm_enabled())
> >> -		kvm_call_hyp_nvhe(__pkvm_tlb_flush_vmid, kvm->arch.pkvm.handle);
> >> -	else
> >> -		kvm_call_hyp(__kvm_tlb_flush_vmid, &kvm->arch.mmu);
> >> -	return 0;
> >> +	if (!kvm->arch.vm_s2_ops->vm_flush_remote_tlbs)
> >> +		return 1;  
> > 
> > For consistency with other cases and because it looks nicer
> > blank line here.  
> 
> Ack
> 
> >   
> >> +	return kvm->arch.vm_s2_ops->vm_flush_remote_tlbs(kvm);
> >>   }
> >>   
> >> -int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm,
> >> -				      gfn_t gfn, u64 nr_pages)
> >> +static int pkvm_flush_remote_tlbs_range(struct kvm *kvm,
> >> +					gfn_t gfn, u64 nr_pages)
> >> +{
> >> +	return pkvm_flush_remote_tlbs(kvm);  
> > 
> > For the cases where there isn't a range call, perhaps you should just
> > not provide the op and have the wrapper fall back to
> > calling the 'flush all' variant if there is no range one available?  
> 
> The core KVM falls back to flushing all TLBs if the range one
> returns true anyways. So, I would leave it as it is.

That sounds like a reason to stub them to return true always rather
than call the flush all so we don't have fallbacks added at two
layers of the stack?

> 
> Cheers
> Suzuki
> 
> 
> >   
> >> +}  
> > 
> >   
> 

