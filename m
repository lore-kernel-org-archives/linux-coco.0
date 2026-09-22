Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AE833DEC2
	for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 19:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790105535; cv=none; b=Jvvgjf/St18A33PDj/lohN5BAtC3SOFRShIczcATlJN2VCroQN741E+v2VL+C7XIFC/a1Ko9ntv23g7SXEEWheR9+rGa3p0TucQaNLbtRHK8rNOPn5f8duAS3KukfJ7iimKiFIhbzOa7o17AJUeHHxpHtkj6/uWo5mtT8sE02uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790105535; c=relaxed/simple;
	bh=3x6/JyG2QRiEHjZ/xYj/5Qj4VWGdcUhP8IUq90zVg7k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Af5af5/IHd6GFPf+fF2PpVL9YZTLob/IyJ7BlKhLuAQTXBYtmWgNDZcPKv19r3R9CC4YWdCAisSmQJj1gC390HutamZnvv/RSURnExRepHi82tYy5sFmRPR0gGvoC+UuhUZ/os07MMZBCd10kORKdyD6alNgD/HmLPgOoITUxIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mCBOY85K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L8mY2pwO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mCBOY85K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L8mY2pwO"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7R0W900465
	for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 19:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	66fYIWxsQudt93HBnJi2uy8V6Tpbsup06vZEiSMqw5s=; b=mCBOY85KbLe6Pzpu
	w5tm5HyGuUICD9mdEO3H8lTMZIUCpf8AFei1DXXS08QcLVEtJAxzdKRouWwQSc8h
	43rMJ5W1G/3/MVoZ2NVTiP/aQRMF77qEnmqQr2ICtHVBKx95XcXwwBBhZhzUNaZi
	4ndM2W/aTGtdu7zacVeMqWQ2F3VzLdj4PunQFUE+vprQYm/aptc2G6sRML9ovMWo
	yGS6qAyhXuNhOmXGFzD0eUXu9QZnEXJqdkkYXPyREtygffmSqExP88MnuZblKRRl
	XasuB15LtZUeR0l/fOncloKgrNSR+OdcY5agE8c8BwuZJn6mILvg5/4XKbLOSOWd
	p2gtXA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gunjyua0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 19:32:12 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-32850005b6bso170907eec.0
        for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 12:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790105531; x=1790710331; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=66fYIWxsQudt93HBnJi2uy8V6Tpbsup06vZEiSMqw5s=;
        b=L8mY2pwOpitCLDgupPqnFPebePfvX+Jc6diSCCHWoCiuEjk8riQ6iSmWtlh8cWFR7C
         y+qWLZR167CrUIOHrKQEwTnn2ABSgIiAKto/l4i3K/5t2945ONRFfbyo4Fmpc96JsqjO
         +RQeZO0L5VHFOttvO2TkUIrNclRCAyZICGPKZOd3WAnS+aNGAZ1GK/muNIg/cmQjRrM9
         DTIhw/qTtp+DzVKcJtSaoGV6HoGVE9Ko23417WTM2u8cLbqRa3eL3Gz2Os5R0F2DGtKo
         j/zazpWIZFeRb6C/rSdKEtq9t6zvrI4JI1KA7elkqRQ98bb2CDahAOaTlIBK1u9iJNYt
         75gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790105531; x=1790710331;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=66fYIWxsQudt93HBnJi2uy8V6Tpbsup06vZEiSMqw5s=;
        b=ZByL4Kv2GbKq++m4mFiEEDH4JkL5gG2/6P8ciAsYturV5kP3wP1O6ZFlTRfV+x80us
         k34uVzrMuVjunExfv+RzYXJC8I5pe3GVgUkWBhDN+bLlfma7Xr95Oc9o4HvdeYjQzJMN
         Y0hF6nVI9b9X+eI/JOqWIhvIEnvfOEAwGYLSvgfNwSw6SN7emJ/v/N8qO1LKg789RWaU
         pCSixtZZLFPzlwhYfzVtj9lJRXMS+q6PqTVqkbCVAJeASKjRiGmmjzoVmvEb+wCsqnIg
         FL871/pKPg5Ej5Esej4uCH/U5ScuEPpDqgzzflAEwfqxZUWwVnK44kCRpqaL6VxhaHDp
         d2Gw==
X-Forwarded-Encrypted: i=1; AKwUvBz/cs2Z+q70vpwKn8WUhBTqze0/3essplMM2AWr0jf00cnrEYpc1BU4ChAx5CpnhlrG9yVgUW9ONdMx@lists.linux.dev
X-Gm-Message-State: AFuF++kqpOn+NfsgNOgSf25xYNSJogrLJVT/6ytbXfSKUxuR0nNiXzcV
	vTjuaBKDDPm1MRNDH74HUVe5uZONjBFjq0bY7utVA6MTMRJOzveHBzrqYjVlA2n1+fum+cLr8g0
	gKdySkwk85gjkJVoe27zlTd7YMO60GvZsHQ024N7kLtAFj8KaZLjz/MAa19tQJha+
X-Gm-Gg: AYBFou16GUdScsy5NIaKOwflmpZs5h45eA2zhI3F90cYUNmYfvvEfiMxJxQfCgFXKyG
	cAO7A/o6lxe6tACOPld8yTuDR71r3nnN6zu9gcXO9YxUV90sBgh/u70hgAmkchm5p1SaFUdUFR6
	ncRNuiNl3Lmhjcj41dNRNNO37lm2liRGeZWcwgKgB4oNSXiFK8NZCSYgMWwBpb5zeXkmDjaw6NC
	4qpl2Fzc5uEBO+3zUUpoAUbv3eSizm5A3U9GRAiV9TmOZJPa36yqOSED8wmzfZB0NROZXyt6oMM
	Uvg5k0tV3z25N5SojVmvRsvLusniyR7wQMtBMxdDFbLHjCA+hpFRv53TTDRGtheDQT36KB10x2U
	HVEOV7hKJjyAY8MmJgLsCpq6h9kp3X8pKBwzZeLxVZTqAy/QR0vQO8iQ=
X-Received: by 2002:a05:7300:e9cd:20b0:33c:5cef:1b97 with SMTP id 5a478bee46e88-33e8c24ccffmr310634eec.11.1790105531339;
        Tue, 22 Sep 2026 12:32:11 -0700 (PDT)
X-Received: by 2002:a05:7300:e9cd:20b0:33c:5cef:1b97 with SMTP id 5a478bee46e88-33e8c24ccffmr310598eec.11.1790105530772;
        Tue, 22 Sep 2026 12:32:10 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96358e2bsm386472eec.16.2026.09.22.12.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 12:32:10 -0700 (PDT)
Date: Tue, 22 Sep 2026 12:32:05 -0700
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
Subject: Re: [PATCH v19 03/20] KVM: arm64: Include kvm_emulate.h in
 kvm/arm_psci.h
Message-ID: <20260922123205.000019b4@oss.qualcomm.com>
In-Reply-To: <20260920212845.707-4-suzuki.poulose@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-4-suzuki.poulose@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: t1lVsvC-m_mCG2RzSPzg1ItxDAAMjG7p
X-Authority-Analysis: v=2.4 cv=KqHYSmWN c=1 sm=1 tr=0 ts=6ab2d7bc cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=NCrhtLsLQcMXYuDHnY4A:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI4NiBTYWx0ZWRfX29WgRFqvfgL3
 /HjUM8WE5XtWwX1vhOCyi5Fxa0JOOQqsLUuO0S06A231aT5luG2UUGsMCRSjQ+JlwGfgMVGCxAL
 r0Ta36gSBXns8dwHzpNaPLSxHkGVX79s2IJVVdqegifGLNvxf5iZWk9dbOFfxsPX3pqQF0rWBtB
 0bZRlzHnMNWG1Na7VUDN9SulH61ezCIcUpwQtRknM2Nv4k7JkEYb/ezxq2wgswTjTYMRPIsgNHy
 hcUBTLZUUcWMgl1su/EPHRLHJE5sakrk3bjhXNdnPvCiyiz7H/Lwf+K5jwW12NRgJDTqWONFG9P
 5FPU+bUbHWFiDsJfhJbpbeh3PkONTd2Bb55g5RJg6yrwQ4loW3yxbzgnb45IvxuhAcuDWEn3u7X
 Mk+S09+rotsFWUClcCJVoHj5F7R4TlFWhpeiS9fXk1jMnnGOR2eJRmal7bK7A2n+Tp1aEpCqoFq
 wcmMgig6EJKC9uQzySg==
X-Proofpoint-ORIG-GUID: t1lVsvC-m_mCG2RzSPzg1ItxDAAMjG7p
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI4NiBTYWx0ZWRfX09Bu5v0l2K77
 ytr9Kxt6jG7qmWCF+o2TrA86W8vLJSk2s45T4HYadbIxu1upbZP1jk8ycdnSXDEkPG5ysEopTxt
 avcWY+A0A7MXGmZI2rbrlSBTDjKIwOk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220286

On Sun, 20 Sep 2026 22:28:28 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> Fix a potential build error (like below, when asm/kvm_emulate.h gets
> included after the kvm/arm_psci.h) by including the missing header file
> in kvm/arm_psci.h:
>=20
> ./include/kvm/arm_psci.h: In function =E2=80=98kvm_psci_version=E2=80=99:
> ./include/kvm/arm_psci.h:29:13: error: implicit declaration of function
>    =E2=80=98vcpu_has_feature=E2=80=99; did you mean =E2=80=98cpu_have_fea=
ture=E2=80=99? [-Werror=3Dimplicit-function-declaration]
>    29 |         if (vcpu_has_feature(vcpu, KVM_ARM_VCPU_PSCI_0_2)) {
> 	         |             ^~~~~~~~~~~~~~~~
> 			       |             cpu_have_feature
>=20
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

Seems like some of these precursor bits would ideally be picked up
asap - though that does confuse the LLM magic.

> ---
>  include/kvm/arm_psci.h | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/include/kvm/arm_psci.h b/include/kvm/arm_psci.h
> index f86a006d67136..06c20612e9e7d 100644
> --- a/include/kvm/arm_psci.h
> +++ b/include/kvm/arm_psci.h
> @@ -10,6 +10,8 @@
>  #include <linux/kvm_host.h>
>  #include <uapi/linux/psci.h>
> =20
> +#include <asm/kvm_emulate.h>
> +
>  #define KVM_ARM_PSCI_0_1	PSCI_VERSION(0, 1)
>  #define KVM_ARM_PSCI_0_2	PSCI_VERSION(0, 2)
>  #define KVM_ARM_PSCI_1_0	PSCI_VERSION(1, 0)

