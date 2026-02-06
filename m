Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB8930C616
	for <linux-coco@lists.linux.dev>; Fri,  6 Feb 2026 06:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770359850; cv=none; b=oBiblaIB4lpQ2MOWobQcKGLhko5vSdwXrb8nXqUabagpSGU9eu93sjxko21tRvHyX7VpoQ9eWcB/1Ktqup3bwVsA8N9S2w1PwVtQy4DrEmDSLsCcCDmmjPcMNfBWQVsxcvcecy+n2JHG30DLEk2zlz6DMyUa6ebv3ePHSv0xmVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770359850; c=relaxed/simple;
	bh=hCSuUhyDepKovVFfLIXEK7iiZgvW4TMXo63DsbeUx+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l2vQDIo/R6LOJXrKSRclo2B9tep1cRgT6qnXhLLbwlLOqGEJn0yXi5uMHfOvAva80h9PSMbuAUuBsVhnJpaGwdMM6T6S3VgDyUyM/voV+mexWLnlM7yBckrcCU8atLcp+hDX8eTHDKhcPIGu+lQ7ZCKIbuMJ2P4e6u6KPRnzPH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PMdB0Eyg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fNHP4BZy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PMdB0Eyg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fNHP4BZy"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6160xeYs3187427
	for <linux-coco@lists.linux.dev>; Fri, 6 Feb 2026 06:37:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YQ77QTJWVPIZC+3oQok+biilGV/ElhSJIADxlZKOIi4=; b=PMdB0EygjMwZ2v4s
	8JWvxgJZt8aBWH/dFEJ92zCZnJ2gL7g2Kb+jSOCvCR8XuCgViI3hNnrL6u6mZtqq
	I5ASHxMsmh/SFTukk3uadZXbBeeES5mkB7HGuDNpdXvMYGuho8j8ea3t5yLW0jus
	AFWPKzh4WOFrte/Vvw0vCwGPKBLrktHLRiesGy2fPzFP34JpMt6Q6xeecvOrzuss
	ZwODlJHN/7GOi2d30ezxTx7cGwU6rD3R0aFYGPVkrBnrY6d0Mw8Jx2uB6M/AY13I
	24j5+7od4inTon7ffDGJeEZO7r4LQWuYxsOwmj1jGXFYZ0+kEWdHVsmNV0SwDSTW
	o4maEw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4prxc79e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-coco@lists.linux.dev>; Fri, 06 Feb 2026 06:37:29 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b7ef896edcso13482432eec.0
        for <linux-coco@lists.linux.dev>; Thu, 05 Feb 2026 22:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770359849; x=1770964649; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YQ77QTJWVPIZC+3oQok+biilGV/ElhSJIADxlZKOIi4=;
        b=fNHP4BZyadfJW2nFeTUKPxP5p9eOrvkrLLc8p3bFYEK6/jLe0UHd6sB6S3sTg2kXBM
         45zC2TF0EggXzip+NYhNKV0WOsi+6Rp/NHuN3KUCnnDmv1SDxjszWllr0FPZr0x2w1Au
         xb+vmOIUpuEoFobU4t8ueQz8ZMb4AozA4EpVLDzcqMmtn6St5bCItNLAfvz0phjziPXq
         UuVcN425EFzimgquNeonfE8NFuv9l2miaNEFYFj//JPHVMG+fbKIga3Xq2BtgX7foMh2
         Ah30v+BkSnGgLG8b6RRvdS1QPpdBs7kNctmqy7QOTma+QTQMhDSP5+GEPqecimwqq0QX
         K6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770359849; x=1770964649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YQ77QTJWVPIZC+3oQok+biilGV/ElhSJIADxlZKOIi4=;
        b=oKJR3ohcL4mSxHZr7OgebGYFjDkHXRce9Fp9hFjWKouncYJhcqrKCu7H9ESD12NuJc
         mK+uI7xPn1hlhS3ocih0RodExpfBebvhADjRXIl6iyeRQC2XOiZztIKFc8ZWRjeIt49w
         CT1qFlrdoI/TewoBVGLTfbKgNi9dQG59DTQNcspwsz8QscfDFHqw/jIQXRMGmLUdrYWQ
         Cy+w+CZb2VThPCeY9WNtHLEm5CoM2Pv2uUsejBJVJBv6kqb+mGJZZ8rwZ0ykwE8MgC10
         fhs6dsxfaHm27J+8Z22NPhT9FxNjGZQO04YDtIz5DihfrKr31Dim7gJW8ZBcuzPTQQR1
         vpVA==
X-Forwarded-Encrypted: i=1; AJvYcCVHY5U/leODKHm5wlykscBdtG4FDte7JSTpsrJVDcM0WJhwUvgZU6mKpnK72/Rsr0irVGbHMX2DXV1w@lists.linux.dev
X-Gm-Message-State: AOJu0YzuDXlxqSCQ+ya/hmKD5Vbbpw1R+uJqaJWTS7LMZHrLQfUR3Kiz
	Tk56Sug07yfUQsS+hnIOrBye/SKvr91P90xNVdNyDiKSr4yTZ4G+2/Abla0yr4/1iXDimvV+G3l
	svm+Lq9GLRbGrAhANdpWBE3+lg5PbJNoOaacJ7v9F+ks6nHcE08K1aqJP7P0qeFeI
X-Gm-Gg: AZuq6aJNECD72IiVjSOpA7ftjZRImB9DSLzTxZa2Sdi/oSNoqeUU4F7A2yfhP1Fhwpd
	KOd47mMLzzIgoNejUbXuQEKRiG0cI5bGSyMCioHc/bJVn60H5qT9/S37yo29UHSagLWw0+qduXt
	8vv3iwf0lddXZQyrC0rCaTGqvxvxej3A0jeq17/sn1QvMESXJaAHaWnj47TtZkRoezeEpFSKJb0
	iE617L4VcRZgZiRFuirJu3ZVkTuz7TI7U7VP1OmyPTqmuARmX2t43JXBkB0iEfXjhfDr+iWaaej
	aM21/1CiqGDPaCM/iw6GJIjHbFU7vysVKzXb5h+NgdgUAJJSME6bsxJP805e52w3mE3iFb6tHOa
	NWV+sBZCxMaSvxs7a8H5cdMXEpZjcwaKOFdqRpyYOR0c=
X-Received: by 2002:a05:7300:fb97:b0:2ae:5ffa:8daa with SMTP id 5a478bee46e88-2b8563d94dbmr847092eec.5.1770359849126;
        Thu, 05 Feb 2026 22:37:29 -0800 (PST)
X-Received: by 2002:a05:7300:fb97:b0:2ae:5ffa:8daa with SMTP id 5a478bee46e88-2b8563d94dbmr847072eec.5.1770359848561;
        Thu, 05 Feb 2026 22:37:28 -0800 (PST)
Received: from [192.168.86.165] ([76.176.48.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855af7806sm1181131eec.10.2026.02.05.22.37.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 22:37:28 -0800 (PST)
Message-ID: <8ff96355-4a53-4790-9d2c-ea7d63be77c4@oss.qualcomm.com>
Date: Thu, 5 Feb 2026 22:37:26 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] firmware: smccc: add support for Live Firmware
 Activation (LFA)
To: Salman Nabi <salman.nabi@arm.com>, vvidwans@nvidia.com,
        andre.przywara@arm.com, sudeep.holla@arm.com, mark.rutland@arm.com,
        lpieralisi@kernel.org
Cc: ardb@kernel.org, chao.gao@intel.com, linux-arm-kernel@lists.infradead.org,
        linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
        sdonthineni@nvidia.com, vsethi@nvidia.com, vwadekar@nvidia.com
References: <20260119122729.287522-1-salman.nabi@arm.com>
 <20260119122729.287522-2-salman.nabi@arm.com>
 <b5fd72fa-fcde-4f7a-bfad-17465d7e3841@oss.qualcomm.com>
 <c29f4a15-1753-42ca-a4a4-ca429053163f@arm.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <c29f4a15-1753-42ca-a4a4-ca429053163f@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hTwlTIUKEmSGb1lmg93R-5-mXAIx7L9A
X-Proofpoint-ORIG-GUID: hTwlTIUKEmSGb1lmg93R-5-mXAIx7L9A
X-Authority-Analysis: v=2.4 cv=eLkeTXp1 c=1 sm=1 tr=0 ts=69858c29 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=6HHVuAIMxnVHkOBFbdoA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDAzNiBTYWx0ZWRfX5c4C4IiWeb0j
 Gw74/S+QjXyVBxqGraBRjFX2IZcLVGThs8p4OH7v1j0M7ub8oNgmt2ZYVtSSO14UnMDOaijx7n/
 F8HSxD4pQ/8KEWD8I12jUCw7FmzViHB6vQRW5E3mFFGE2hLxmnm5TODYsKnCSHDsonqy2NlyaBe
 o2WCIOWHYu5WmiUYK/nmjWolx0xhF2I3mv4mamYozp1JErtF8MqUNNv4mS62hKFJrN++gpgajSZ
 KWBhjRRyM6lKRPz1ppxkay7BStR1sZ9h8qSMNXxcNnWBVYds86tyg+sgyKs17E/jzCBUHFRPCW/
 /30/hZiY8Io2fEs/mv19RABp/QEBzb3BgtpDvRrJXLLPBso2rJasMrTVKfAp2hdXx6Q9+bCSsE0
 5yRdg8icKdLFyJJEeqo3ITraNI+W6hhnRe9dsiUcO/minwcMdJsihHMQu16ZWJo8A+T1ntPJEbv
 /OIS8W7kdejj8EMI+1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_01,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060036

On 2/2/2026 7:52 AM, Salman Nabi wrote:
> Hi Trilok,
> 
> On 1/31/26 01:35, Trilok Soni wrote:
>> On 1/19/2026 4:27 AM, Salman Nabi wrote:
>>> The Arm Live Firmware Activation (LFA) is a specification [1] to describe
>>> activating firmware components without a reboot. Those components
>>> (like TF-A's BL31, EDK-II, TF-RMM, secure paylods) would be updated the

s/paylods/payloads

>>> usual way: via fwupd, FF-A or other secure storage methods, or via some
>>> IMPDEF Out-Of-Bound method. The user can then activate this new firmware,
>>> at system runtime, without requiring a reboot.
>>> The specification covers the SMCCC interface to list and query available
>>> components and eventually trigger the activation.
>>>
>>> Add a new directory under /sys/firmware to present firmware components
>>> capable of live activation. Each of them is a directory under lfa/,
>>> and is identified via its GUID. The activation will be triggered by echoing
>>> "1" into the "activate" file:
>>> ==========================================
>>> /sys/firmware/lfa # ls -l . 6c*
>>> .:
>>> total 0
>>> drwxr-xr-x    2 0 0         0 Jan 19 11:33 47d4086d-4cfe-9846-9b95-2950cbbd5a00
>>> drwxr-xr-x    2 0 0         0 Jan 19 11:33 6c0762a6-12f2-4b56-92cb-ba8f633606d9
>>> drwxr-xr-x    2 0 0         0 Jan 19 11:33 d6d0eea7-fcea-d54b-9782-9934f234b6e4
>> Can you please explain or add a note on why we don't have name of the firmware
>> as the directory name and why you have selected GUID as top-level
>> directory name? 
> 
> 
> We obtain the GUIDs of firmware components from the LFA agent in TF-A, which does not provide their names. For convenience, we have added a C structure in the driver to associate each firmware GUID with its corresponding name. Because new firmware components may be supported in the LFA agent before their GUID-to-name mapping is added to the driver, we avoid using the firmware name as the directory (kobject) name.
> 
> Additionally, sysfs requires directory names to be unique among siblings. Since GUIDs are inherently unique, they provide a convenient, collision-free choice for directory names.


Thank you for the explanation. Please add these details in the commit text. 

---Trilok Soni
