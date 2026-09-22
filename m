Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9827252FE41
	for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 22:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790117628; cv=none; b=J0ZIdEENdBq5bIcWv2hl91Kigz+Vi7gWuGySiThc+SQuXheVCzy5mXqyHXx2QO7i1eJb+ufjBD/pHC91Mzqa+CLMiOgRhk0uKgr1xJ425otK3ua5ZnWu8I2DMdLv+H9wDWPC5BaCuSl180YVnpVvQ436g+m5g26d0AvRgz/hgJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790117628; c=relaxed/simple;
	bh=343dUSnYOysjpy5fyuWntmT3fKeHN580Y5d1wxsBcrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ruAj5R9Uj3rpnCELUT0nhPcBpGpl+uYWLLjdidrcY5iHM/ed9pRsWm9rKzbB6gppTdptZP7hMU+ddrUG0kYvhkn6NMN6oYHVx/+F9gCG3PjDiMWGzz8r1qZeqXAJlx94zZ+cZaK8WWHk0saLUiKC/aJQLg1vOI1O20JGF0rXjoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T0jMB3y0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C4udDO3A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T0jMB3y0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C4udDO3A"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7C0K368050
	for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 22:53:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ij3pQRHyLZbZtGm1WSsSpgH2KR2KK6oLa6dVIzgew98=; b=T0jMB3y0rL8j0v0n
	uLQ9L1ct+DF5ggyvqScz234nKNMbEy/2euOzbMqYlNwebz2EMqzizBoskOik5kaf
	5OJIIYXDaGGMxfc/PbxdMF/xa4eAmIHoSu9t2LwPE/BrNcUHf687+RrvoMq3mckU
	/ss+V85KBbnPpfroU9jjsSPT4EiBw2ScJSrw60JNNHk8Q5KBD3+Z74OtnL05CGbJ
	2BeU8SYiC6J0gBkULd3MqUx1qpkZmxmzDe2RreJezeE8IQmEu82IDQQkZ3jzRuJQ
	Y0efI4/JaTIRCIlDteaRp6xaaXgm7pLAJ+UrhwjYelKZ63sE2RpbOoQaT9CkoG7V
	Rz3sNQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gurntbbn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 22:53:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-32b8c2b30c4so399251eec.1
        for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 15:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790117623; x=1790722423; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ij3pQRHyLZbZtGm1WSsSpgH2KR2KK6oLa6dVIzgew98=;
        b=C4udDO3AR5kAVFVy2N/rxYxrwH0TYSasyIP/2P/pnh40So+b0duWoS8bHPXv5nVFaU
         fVuSnNUiQNwaJ+t90g3D9UHBZuGLglvM8Stl8U0WGr6bPSGLZ4qOIb9xTDcAlU3Z6xcj
         KYvctmUWDcwl/flKB7YjerVEZ501zQahiRfTTOdEl3SNH+tbukMdbyNHMHXInyPgMSjP
         Lr+LJiwDp2GuuwGHti8Lg4gkOPFvCLcD11QEw5pIy/NzGw+GEh1PkNYBnmx3tzSRzP1Q
         43U++ZV4D07dWxz+AWtaRN2TrAt1C4UhNUUvTvNX2b5tTw4YHcZPiZE5L48iOFsWhpa4
         Dx1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790117623; x=1790722423;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ij3pQRHyLZbZtGm1WSsSpgH2KR2KK6oLa6dVIzgew98=;
        b=QanxCyM1Lk4TvJ3r3OCYzp2HTHNoz2TAnChvdFKNbXUib8iEYZoYq2394JGbeQES/1
         U1fL7EwFfOWdHpGabKsSDAqB6tLHkjVSb5QMC2LCsFIBNvi8a6BWCszfvUr2rkoUZq6H
         gzkYsfQJh/IacpVVc37eTdWTdLtieSwP2lpxz+y3mrl0IwvPBcfx51eQob5eB/C55j/G
         pfzOHPYfEjLhSSmT6QbHkKc1oXBDfgEYZTA9JYsfKQXsTJtagpaMJMreUvA3ZWQXflEj
         2LTGvPGvecaJwZJ7+qr6/+HXqCN7RmvJ7zAPjuNf4/9TBjdiJ0tljkpdFCJq+LuTdZ/Q
         5ISA==
X-Forwarded-Encrypted: i=1; AKwUvBykMTOApaCELboczZu3Ayx4w4RrpuVAzUaetfAMfnlmZ8Iazdm0+nHGjLwF2iGSf7BuXxNboQ4r/o3e@lists.linux.dev
X-Gm-Message-State: AFuF++lb57rVjITT97Qmez/VJK2pl5EHhciSrI0JFR3dtVL5e54eFEaj
	darYoD2wVjDppafHTv7vuY34NZeAfWCL+VN1kF0TKG6yWymNor7De3epOQm60O4hSUIK9CHLATM
	iW8VGexTqNfC+6Ozx+1LbreowtqlM87OHPzwTWD5fyX+WKIdy1sW8RYllRjB9Gj/r
X-Gm-Gg: AYBFou3s+PPYbJ/+OK/bjWbKWHVon8P/FtpwG6rk8cllCibAkTaiuqrm4goyo50FkBn
	pd0AiCMT9yu+qJnqTToKAI7EFiu3R5S291h5QuUvV4+VytuKmVOBq3gUuCizxbasDRaKQle7+L1
	U1Duc80vFWfQ/40792QoGi/TXCllYkklg9ayqqi27UUiQ/PXx+nXlrYUKjpgWpqCTJcjEpExk/b
	eoZykqV4M1CEYpnj2NbnS2FV8eEjR0Ot6n7CTfPcP6qIgFIGv95lYdtY08qdb9ZTyMpB7ov3LVM
	ldxvfVVUOXMx8/BNzb4VBP5/ZNQbeEs5vdVi+w/XlywK1ZP/7v1D4h1qN4agPgs1vl0MI6Ty//Q
	D/L+0oGndq2goWFGy7IJxWm35wQuIM3d1ZDFyCMXycWkGh78Iz7w3aw==
X-Received: by 2002:a05:693c:801c:b0:33b:ef1f:14b9 with SMTP id 5a478bee46e88-33e8c250524mr868820eec.15.1790117623060;
        Tue, 22 Sep 2026 15:53:43 -0700 (PDT)
X-Received: by 2002:a05:693c:801c:b0:33b:ef1f:14b9 with SMTP id 5a478bee46e88-33e8c250524mr868793eec.15.1790117622505;
        Tue, 22 Sep 2026 15:53:42 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96848e18sm1178819eec.17.2026.09.22.15.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:53:42 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:53:38 -0700
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
Subject: Re: [PATCH v19 16/20] KVM: arm64: CCA: Don't expose unsupported
 capabilities for realm guests
Message-ID: <20260922155338.000064e5@oss.qualcomm.com>
In-Reply-To: <20260920212845.707-17-suzuki.poulose@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-17-suzuki.poulose@arm.com>
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
X-Proofpoint-ORIG-GUID: HI9x0UGH2kW8THVr5UajjEpuJAuuFmWf
X-Authority-Analysis: v=2.4 cv=eauo7LEH c=1 sm=1 tr=0 ts=6ab306f7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7CQSdrXTAAAA:8 a=z_NLTHdx8yjNkCs6FmoA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMyBTYWx0ZWRfX8D1sbLaUa6uo
 VO/P/pF9gJK2x7U+NT8HLfw56C1ky1JRUDqx4jWbVOT7dRAVSczr4TflYLmC6p/X4M+m0h/FB4D
 om2ykGuq39YPJsZvakpKAD87rkk03LLyLBvViS23LY96KJrVGVCkll49JI9YVhNgrhNcfEdAvmR
 9hAAcfgPiSkKKrWxnMgeNBbpOI6NUgsb3Us/MsEjnFD0q1ZUXXIqFIs/oltTDb3zn3jY1eMG0oL
 +HoqKixJ7iOnMVLTGWfiynmlimu+zTbunW5xedGM3SkdKPW7IHIHctr+NFPJd/u9fg1sYW+WQig
 f+X7PTyGomSMxhrnyOKexe+XdzfxNj+W8Da+jyh7Mvt3/HN0ofTFCSrOljk5oB7DJHO7vCgCnXh
 O3rm0GTIn7a3wOxFHvz3/5sDQe+b4y9vBS+vd0i4loQ74q7Z/+EeZpQOYugXsraplHFtzobAymB
 nkvz+C7teQXWuoeWc8g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMyBTYWx0ZWRfX2FMEzna4VRHA
 +ERlBCnXzgJfNp900xRDpSUANGj3FHLQ361WrjZi/AFvTih/lyzFLnChsuR/e7Tn34/uFn3wr/h
 QwD81pcqhEXLe5LHAeU4Cs+AfMWMZwY=
X-Proofpoint-GUID: HI9x0UGH2kW8THVr5UajjEpuJAuuFmWf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220303

On Sun, 20 Sep 2026 22:28:41 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> Limit the capabilities that are allowed for Realm VMs. Similarly block
> the vm_ioctls backed by the capabilities.
> 
> Repurpose the kvm_pkvm_ioctl_allowed() to support both pKVM and Realm
> ioctls. Rename the helper to kvm_vm_ioctl_allowed() and move it
> into arch/arm64/kvm/arm.c. Also add a generic kvm_vm_ext_allowed()
> to handle pKVM and Realm capability filtering and route them accordingly.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
One trivial - otherwise seems fine to me.

> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 86e705330d7bd..eab8543a4194d 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c

> +/*
> + * Check whether the KVM VM IOCTL is allowed. For pKVM and Realm VMs, certain
> + * ioctls are not allowed. Further, certain features are allowed only for
> + * non-protected VMs in pKVM.
> + */
> +static inline bool kvm_vm_ioctl_allowed(struct kvm *kvm, unsigned int ioctl)
> +{
> +	long ext;
> +	int r;
> +
> +	/*
> +	 * We are guaranteed to be called with a valid kvm instance, as the
> +	 * only caller is kvm_arch_vm_ioctl(). Catch any deviations, as we
> +	 * rely on the kvm instance below.
> +	 */
> +	if (WARN_ON_ONCE(!kvm))
> +		return false;
> +
> +	/* Cover both pKVM host and Realm VMs */

Comment is a little confusing.  This is the path that covers everything
other than those two.  Maybe 'Rest of function covers both...'

> +	if (!kvm_vm_hyp_is_distrusting(kvm))
> +		return true;
> +
> +	r = kvm_get_cap_for_kvm_ioctl(ioctl, &ext);
> +	if (WARN_ON_ONCE(r < 0))
> +		return false;
> +
> +	return kvm_vm_ext_allowed(kvm, ext);
> +}
