Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8F35304B2
	for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 22:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790117029; cv=none; b=I02TFdlzfTqFaZKLzCN2J/TdVlb/o7VrYjlSs9B/zAGz8ED+eV2ml3sNtuZYLAsvRqa0Sm3z4EB5I2NwrO37M7pWfewQ2v+0qJHEnBZwX8IIiHRkSM+1JL0wXZZ8RdLmZ/blcV9DuWfFqCg1JdihIdoOdHwMgl9efYIkIlQnjcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790117029; c=relaxed/simple;
	bh=TNq7qZv6We95KhCy65nIeyeboOhZEhkFGiez636Srtw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eTH/jssedyOlbcZdY5THsjWpsWgMOBS8a0GqrGDj274oqhm9eyTUmlWenL0gxstJQFfqPnc2wvv00WoBi122DWgaAr6TapJ44XyKLXc8oMJFs2Jyet5cvH/LO2ByusPHD9gctCRROOGZhJNAzlLhZz2/NIaFCqpjk1X+KOGhSlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OFNcuMXm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hu8hP1m1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OFNcuMXm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hu8hP1m1"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MIXNcA268287
	for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 22:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kg/OR840iDQhdwyUp7pmwJO/JhoDMeTO5E4K79nehm0=; b=OFNcuMXmh7AGmV10
	knsoRaEgW1DOXMPkqE6axrjTXY+QI16SKZIKboXNKJD8Kc15XTfM8fMpkusI3SQB
	8CH7dzkYILyelxqMjsuIlmXORALfUutonB2Fbs6VKMtVs1roC1vztFKrlov1xzw2
	hXKWqyb3DTdebH1ZTrkH0nzOrORjvr5ikINWS/yib7JiWlHVvjaEGc3nXzWM5Xy5
	MPolplbsyrok+Nnjgow46lGAHmXPvPsy2UkBo7NfGyx9oUoPoIZ1eu4ABfNTyhhl
	IyfCoyKZUh9NeeQ3Wn3tS4pPdM9L3MNv/m2vfUeCK5Npev/TGbIV+aKk4UUutna9
	Mqk5rw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c1440-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 22:43:42 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-333543ac378so308911eec.1
        for <linux-coco@lists.linux.dev>; Tue, 22 Sep 2026 15:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790117022; x=1790721822; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Kg/OR840iDQhdwyUp7pmwJO/JhoDMeTO5E4K79nehm0=;
        b=hu8hP1m1HnaMz0zpjPhFHwDshLOnbDzhI/Z8gwZkeF1WyXiKw560GxsGJza75pdnVn
         w3gFFA1Qc9f7K6ZAUb5/kUZXaHpyWDwg94P58owsDSILEvRcppP7OdyeTdl0eVoHFaJc
         WLEVQ/1rh+0ZMvoOaUk9COOe8P8cGUMriToq/etyO9aSLZzDEcV9zGjx+tjNs6sOhNJY
         MJHImty0M1WiShzAiPZqVv5X1ow0NSDaKgojhphFPMsBqDU4Gm9NEIekr+cxgdKHotZt
         0Nf1Qyw13ce3UaWeswyx+O7uF+ILjvmyD5rw6168Hzm5/i62YNIZVLcUAabtMEVJd3rC
         5kpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790117022; x=1790721822;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kg/OR840iDQhdwyUp7pmwJO/JhoDMeTO5E4K79nehm0=;
        b=V8ylDBL6cj58Ghl2Fk/vo4zKOr0JTA0SE0QHWNVjacUFJZkgeVLm/TM0SciJFScVip
         x3SJqnP+y3yZMbDr+bG8MiaAYKlgv4HY+jyh5MYnrytBXDYDkcpTXe/6T+76+mE0+Tt1
         1kjfVnKZveJu0n1fkd8KEM6LoldeQnDc0Uv/Ffu9ccKNOGinpTtRDhLp+e2XM5001nHB
         Nx0bIQhLM2HOFR/xG+GWkhKSdQXhSUry8z/LQjrULKJ8Hf29O/bKkQ40IRTLl049eF6r
         6e6ls5iql21LWe2RESr2Vq00Vi2v8GrGasDGYMWTkoRaVj3JOvCUUb0fDOPAQ6A7cYIC
         FU9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwM0E2v6e0t4841ehD4+unmupK7M87ECbok8UztYcLj3e1/zDMT61ysdEdB8nrRBw91UexLaT/BWU64@lists.linux.dev
X-Gm-Message-State: AFuF++lFmbipc3UXKr9eAjxFDEbKD5B+kX399lmFNfeDTzNnw1IrdfBH
	Ig1PsL3D2aYaP9pb5YrT4eweKu8ZyWkByOxEVcnWTedFaNqG13gj5+HaXEfbxT2bAviW5E9utGa
	4LeJ/sSNgs8G0t9Jqye1BxWYwNAZLZ7i+Gjjrgy4tlNeLMCkzyTlOsEZbBWunrDY4
X-Gm-Gg: AYBFou1NcoMkBp1cyrjcUEe5PMxJ8/D3fTA+xBe60DeOK+eekaH5Gqy8c9ES8CJ8bq3
	dP3PPfUZz/IhsiG8/uIyWNO+gY8PrQwiwPrv4GqRrev+ZQxyElfGbhLBYOVQKN04pLhfjnptpP1
	q4k5V3TOvZd9pVGnL54odrPP2VrpktCfzV9FYU8m5zKzswxuB7MkbQRRJsbZp8j5mSr467lshRc
	bH75lBUcpLly+lK09S2q7TxNAltvI8bciNsAFfYlKvr/LV047jQNKpV4nNf2S5x37r2eL8KB90q
	zL8ADI1IMFIpqtDugjeCaBcuHGk1uDH6MDELXus0nKwk1K6N84kS4QMwdBx+qWqoZQDeMnW+4Zp
	DTq3K1Mz40kyqFRgudemwFHuDCXqhdLCxSEYCRfhBk8OKeIQ/e3f06w==
X-Received: by 2002:a05:693c:638c:20b0:33e:3f5b:3ff6 with SMTP id 5a478bee46e88-33e8ca260d7mr785982eec.18.1790117021843;
        Tue, 22 Sep 2026 15:43:41 -0700 (PDT)
X-Received: by 2002:a05:693c:638c:20b0:33e:3f5b:3ff6 with SMTP id 5a478bee46e88-33e8ca260d7mr785932eec.18.1790117021259;
        Tue, 22 Sep 2026 15:43:41 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96258978sm1124102eec.14.2026.09.22.15.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:43:40 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:43:37 -0700
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
Subject: Re: [PATCH v19 12/20] KVM: arm64: CCA: Add a new mode for
 supporting Realm guests
Message-ID: <20260922154337.0000762f@oss.qualcomm.com>
In-Reply-To: <20260920212845.707-13-suzuki.poulose@arm.com>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
	<20260920212845.707-13-suzuki.poulose@arm.com>
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
X-Proofpoint-GUID: YR-SRxI2jodzDyZ4KEVlm4HGQJKDlrdb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMyBTYWx0ZWRfX7YoDDgA08cGC
 Vc4xAomgtxcT+JfXnIGo31uAnG+X9IrG33xvlwb4aQFtPsXpFxKiG/BFfHxAC/K9KuTs+KtsxYw
 rvIw7OcIgmpP0UiClgsJVphQEf/bYrQ=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab3049e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=btJ7bRNyUFryZYO5LPIA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: YR-SRxI2jodzDyZ4KEVlm4HGQJKDlrdb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMyBTYWx0ZWRfX07pId7yEL5aX
 QvkhBqKaZKNq7W2Jh7m2W0WFQw/ONH7b/9YHHQE/KVA7y7kSc3Ni1fb3ARxEk7iRLl9TcHxL3bv
 NnT3fPykViJpENIfs4yn5wPUuyjBVxOnprtuwFPpf+Q0tYDTUUR5Fnz/pC6Wze9eJ/kCNUGvEgx
 yTLRnWJ9bKpq3MPM7DUCqXBG9+RH7N4qcPly6ybZKq52JnSllb1zHZtkm/0+1R+rPpYk5K1neBp
 qZCmX3+zp1QBrj+zSxl+WzKfIBE8JiV7mJgNBjYXUKIGv+9BiMHaH/JcFRrx51D7Oec9/KpiqXb
 JIqkhuZ2kkcUWo+3YcLIhY4p8lFSTUE8tYI5hC9jGvcU0Uv0GjUKtCjYC2YqxagP4o/whN+n2QC
 sycrrHJtLmgEwb46umMyvHK46FW/mJJupGUvleYmr3h45ma+95J56nIuuBP1yhAN5nr9thPWV5n
 5qqZtOE6oxXO9q2m6Nw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220303

On Sun, 20 Sep 2026 22:28:37 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> Add an explicit mode to support Arm CCA guests.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
FWIW given how simple this is
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Mostly given so I don't read it in v20 :)

Jonathan
