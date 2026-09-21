Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851443C871D
	for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 21:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790027625; cv=none; b=M2G4MpEsKcPnJATlu1vCPLTI3IK0EAJQ18QPCpQ+/7HoyyfHsthNCb2M/JFkVhP6yIuZ4EdE/zoJkmBISCbGE9ZlErbI8pTr5WXAzxVPYiYymadrseWth8kmUIdUSZ31MzBmxAxzcR9AmFC+sdmSdzkhSGH+GIpxeJtjhoCTIPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790027625; c=relaxed/simple;
	bh=xk9+H6CvXaIi2b9MCe7qP08mfzgmJlROo6JCtBtDH9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FCjDn96LTYmI6muYRg0rwqxylIltUfTix8Jp2EnLNSVJeLmggyUfNlbbpw/C+0kFLPUmygqdqCGZcVkzIYY68Ou/z1vw4eXOB6+ua79IFNWD83mv78hD682WGCe2WQjg56BZaqGuNtAr5h3xBxKy51Gc/kbPuUd2eh0EjRRYggE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sfrlc1Bh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FVbZ0m1Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sfrlc1Bh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FVbZ0m1Z"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LKeJYq2260386
	for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 21:53:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nCgFELu6kIfcPsQKoSSTfCHDAyLCU7hgN7NBMBE2YJk=; b=Sfrlc1BhVwMkzGmR
	cmMZ3BWRONujILmAX4IVDq7hZ6g+YoOsnH8oDCHIonpP2TydSD4fCHiGcWWdrQzh
	mh2bS8lWSBe8zVt0Tzj5APVjagbBv16VVRG4Ecep0ObquQhVCt8xKFxg+6tJYriu
	ZqMNSeUKkzOKklnPU3g0qsD7XuwuFKXubSS1Lp6hpGSd7DenDSKPpfkDSf4FTwBB
	6gduSi7fZr/t5ouxzILhAyv9Lq2fUy5i/9b7XBlTwM5NlX0G5mJfou/qjGn21rgq
	c1HrR6k0sJl1r2tTufr/9gZnF6qffL6+UgL6rwRhyGgyGLUSOvkqpmLxNnEWmYbF
	IjPzHA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8w7916b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 21:53:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2dd8920c132so81512495ad.0
        for <linux-coco@lists.linux.dev>; Mon, 21 Sep 2026 14:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790027622; x=1790632422; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nCgFELu6kIfcPsQKoSSTfCHDAyLCU7hgN7NBMBE2YJk=;
        b=FVbZ0m1ZmDfVMuOygRputH5e/V5SYgcqcvhO627NLZB2XTWwz49SPy+ayHbJIee7OH
         qhs39IOqilOfac1Hj9Ci1FLSmWbWEvWWkbZQgiZ0+hcnfomkZZkak4CH7E4QLHm6qvp9
         2Afk10jsDpnJeWkAAhg8croUNCIyPQBq8Q7nWEMt3m2SJ/c0ja6VfCvTPa4tTgzy22YI
         UNZWBAOqX0zwh4t11w7nyuXNZRZdjgfzWzmA+sHEAXk+nUPVBv3IWtI7PPbjfwc3La6p
         qOuTNY1vjn7lNeGYh1d9VRkqFkgLhY/JjCurGn0L8KbP3laydW7RXbX8ogVqYEm9GqCi
         NEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790027622; x=1790632422;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nCgFELu6kIfcPsQKoSSTfCHDAyLCU7hgN7NBMBE2YJk=;
        b=rD9vDMzTk6b9BHP0JsNdDHdw68YtBfSH6dxK2AGa3sl9ypNbwUiGH8WKSQkYGfDdof
         rP5gSexyy6LdegddF4Omood53POmBi7Cyn8bjKH5l4VtKKFhy87Zb9h86CrfkDJS5I2R
         6EjxbsHKbtAGjYR98JJ2d8JdNu5TLSMV0DeHU4kn0J6RfLCLlSzk9CrEly9QKp5pepfK
         eQ6AO5Aecx1IT4SjwB2tVWkHPf6IDLtF/03VFni8PsVW7HHhxR55yTTgRMRE9ThBArWR
         vfnhHWMluwWoKmxaM6f4Oxm7dKuE10m30m1mQfMHxs7QbhYs5GGKnDY+p1mOuGpnWqun
         /N9w==
X-Forwarded-Encrypted: i=1; AKwUvBylRhwKQFm1WiEm+skYsbIsWf/jv7VGmpcnBgIQpN0AlI3g/EMxznK1JB2krb0tEvjDaLKz0lcCN6XD@lists.linux.dev
X-Gm-Message-State: AFuF++m9XzqcmAwnV+ExBMvvPTSJbX3uPUdR17xCyrkc6Ck99BjR3QVd
	tdxWee+KqF4IKJt4/z+259y4Jjt05GSwWnEC4EXowTbejW8Dlt6RW3s9nFNo3zM2pl7vcmvf0EV
	weNiueiM/LJPgAi8t2kxfs3b9V6zUsFYLrapq7FoQfq3O4Lv4oC0+H9jvwrtcSahV
X-Gm-Gg: AYBFou3xISXpDab8XxhomQIp5+sC+IoqHjyjADx87cQo8T6V92Ro7X9P9zfKEis13T2
	ZB4R4YrO2vfiLr0EuajtyQsitecQzUOMu52a0/UvB6OUL6RfoH4RVXdCKFV1i8UYZj/haWnfzXh
	QIlqIxOLuGpn6gKoxfvvbeKRddpz3iDUw3nD8HE8YveUoj/x03VOiIRdyQyvrkF2HfZJGUxeyXU
	mk2QqUhxS8rrZFxVKzn4Uf4zDQO02ETI5ncHSezvuvQvOGjeNCnogRwqRpQBg6EYg7AGQ/6venj
	lxcM/Urgu0XDaI4NXvg66qxvZ3RNY/JfF1KrUS2GEilfxUBi9TaOH+EzQRB4QTa6QBmD/IQdmHl
	0E6SeK1UuFawvz4spAFpGumoogw==
X-Received: by 2002:a17:903:2f89:b0:2dd:60d:8b7c with SMTP id d9443c01a7336-2ddb1b1190amr169294105ad.13.1790027622370;
        Mon, 21 Sep 2026 14:53:42 -0700 (PDT)
X-Received: by 2002:a17:903:2f89:b0:2dd:60d:8b7c with SMTP id d9443c01a7336-2ddb1b1190amr169293795ad.13.1790027621908;
        Mon, 21 Sep 2026 14:53:41 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5ec16d09sm710143eec.23.2026.09.21.14.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 14:53:41 -0700 (PDT)
Date: Mon, 21 Sep 2026 14:53:38 -0700
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
Subject: Re: [PATCH v18 0/7] firmware: arm_rmm: Add RMM v2.0 base RMI
 support
Message-ID: <20260921145338.000070e0@oss.qualcomm.com>
In-Reply-To: <20260912083611.2513845-1-suzuki.poulose@arm.com>
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
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
X-Proofpoint-GUID: sWQHdfyB2YfdjK68JsRuMxa51x7ww4Td
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDMxOSBTYWx0ZWRfXxwzQr4uLoPEV
 /T2rTgeVMuymWXQNHT/zRghSI4QWXMBtwuwpVt91S6TovPpq1+2P5h9RptcfiragSllOu0IBO/S
 1ByqB/KExvYXdQLFfsZ0DfxKHFt7AMJuEN8ajjij+FnzwiHw+6v3vcU/5sgoHQkpYJhbDO6licp
 2m1AtK1zrBiY1pY9XoPtaBUTGCWTMcJnQozCT8jSULHAhW2j0qATd3if9wKhp2gsxNuVtaPZFPk
 DgtVnQbQgNb5ffS/l5RD9ywN3X6vl0fJpZ0OC/teAUKaeptxFfq5ZdY+lbOCRr+pswZs9tFhmi9
 gSPkpSS0e2V40mdC2YY6g2WGGlQATOf3ZYo9+cRCJESHByduFRB0G0AQ0TrTSdcJZOczEhRbmuM
 QlwixFM3Sdm0R/8mKuXxhFFPqfnYrfS2/8otvtaNEDYjT2ICqxO2Q150vU1x76S+2gSOeodyBKF
 gbSI5nI8PS1fpdz9f0Q==
X-Proofpoint-ORIG-GUID: sWQHdfyB2YfdjK68JsRuMxa51x7ww4Td
X-Authority-Analysis: v=2.4 cv=Vqi2kO2n c=1 sm=1 tr=0 ts=6ab1a767 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=_lSb5bjROgHUFZFBuPEA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDMxOSBTYWx0ZWRfX2uYh7oOtuzV2
 eHbLYBdVuhB+i8FW3ShUF1vxFcq3+C1eZwYBt2D6ByJI0gn7aS3gSt673HIx6fCUh3JsbAk7ysk
 5sgn5LLutxsuTTCRBnegKWD12bMETQI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210319


> 
> [1] RMM spec : https://support.arm.com/documentation/den0137/2-0bet3/
> [2] This series: https://gitlab.arm.com/linux-arm/linux-cca.git cca/cca-host/fw_rmm/v18
Not seeing this branch.  I wanted to sanity check on discussion in the thread and
was being lazy so didn't want to check out the branch I built for review.

J

