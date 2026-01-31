Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A122BDC0E
	for <linux-coco@lists.linux.dev>; Sat, 31 Jan 2026 01:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769823354; cv=none; b=oeaBe9EmeHDLhuVJeVQxymfvKjlITHhTrYNFetpMD8D3d3ehJ50WJZKBtO4Xxc4WMk4IjBLkfgJpk7kPgDhNZXW9AxewZ5ykU8Tew+J+afWDYRYThdK57CPqRWqQnyqyZn+MLw6bgSQmjyPB6Lnbkd2ZnRBhUYSjircgV+osdD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769823354; c=relaxed/simple;
	bh=//zuQGDg75AAzG4mX2nsTxA+R4E8v+nGo9+PGd9h1yI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a5KX4LIjtZ0e9PKg0H1/K18y7uSwNHysNolBwfv7iG/CxlmdR2Bb21lpZ/aQ2mduXjNzMAfgs66nZ/oDcTVY8bTolhV2Ka27t+OC4JECmrUime7ZMsFjBdhH+3BJ4L38cVkyfHXfVIz6gsJCABmH8rIpkFcSELBLPB41GrnVYxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k2K2eiJ6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j9tDY97b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k2K2eiJ6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j9tDY97b"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UN6PIe3973737
	for <linux-coco@lists.linux.dev>; Sat, 31 Jan 2026 01:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nwKIHPfIqNrQskRu5VV0SgqK+bxynliXs5KVFHdnN9Y=; b=k2K2eiJ6ngAR8OVI
	iqC12vjdCw+SCciisdf1O9PB7J1bFivbr1BFQZqOvtxU1SiowRPWsi8iTQUEhY+x
	PGidqZT3WhoA6xj+jN8dGONU0ThPejazcw15rCkIvADEcyaQaehklZIR/dTPIW5B
	RKhK37kRqM9SLQdKBYHwVKHEmTbmp//23ZkSa2WVIpijfiY9RwmtyzzOsFZ0Xeyj
	dOfogsSV6C9SceiWSJ269Owil+MJlhMESctzkiH6cyzOlego+gKBpF+m7poo3spL
	23opbujIAJ8muit4/BEtXC96UDlnb6YB/opy+n+SLpYkmndLBKUm82srAkmEsrim
	3CqldA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1614g90j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-coco@lists.linux.dev>; Sat, 31 Jan 2026 01:35:52 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b713fa927dso1920285eec.0
        for <linux-coco@lists.linux.dev>; Fri, 30 Jan 2026 17:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769823351; x=1770428151; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nwKIHPfIqNrQskRu5VV0SgqK+bxynliXs5KVFHdnN9Y=;
        b=j9tDY97bgg2mCeIIjh4yTToI0024ZovzExF/YpbqoHixOIhwn/gjCsv/tuV9xZ51h+
         zt6XKx5UdyJZsezLp9eTDOVBQYgOEXxbVRkLD3T4OSS5fbq0orHLA+/5HM/2Qaie4TEZ
         Q43VpVAXU6TCp6aA2B9VpjBwoKoKJCMd30Mgj61mbAMRIzHkq88O0ZUoNLuNYWKqz0rG
         PjxRSWT1wZlhhkrV+l6KrSL0dA8xiQom1ft3AhqQ4Prf4MEWP/w7Xd2+mpndi0hfSIbu
         1OhCM3496P8wlfw9VD4Oy2lfSR7Dgs7pBfaK3lDWXKRrgM+2N8BfVodIX8G7ZLnlWW1x
         Wh7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769823351; x=1770428151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nwKIHPfIqNrQskRu5VV0SgqK+bxynliXs5KVFHdnN9Y=;
        b=iZ8ZcBn9TMKZQgA8LTYV11cNtsLNOEGXhXwDSZz/074+6IpqyF4HIM/la73Jd4St3D
         CIwb3P2kEsCyzg3+I2HY/RIvIDNpas8GPjX3hGBUvYo7rtEfCWk0kjnnt9re1h5qA49E
         f6b2+FTc9QjqP24kGGZGQQ65D/JRVGzLHLucY+AkW1GCp8i756NfhaLba/AxzBlc21Jj
         j0u7PRPiJzcka6hlDmvdpJClGIBfLIgLyQGGdWTGU4BVw6PH9i7Aie0WmkgXtUj+oNy7
         DgSwsA0oUCKoLEpH6R9VYjIp97QO4lP4A7+vli4l5ZCL/PoGpgKChbH+0xUs4YY1E2Zl
         A8yQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMilEqnqmS7KFRJ12DHWWD1FUKnAfnKANWbVvoL0NBtqcQYLBNa3QpNv5irwEGh0O3/iN8CTvYrNNq@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/CQtd1Z1BfGWBBY/lXzvmfurSo8xn51tOH5WjR1lRrTK13PQf
	PEg24ov30NSZTxncfyFLqrfLQ0bT2Xqhx0edhDc5J+JSSPTQuxPcOL+Or7lh2boARMl5fxRHZNW
	qmwlvmn4iJvnGQ/DYZ9JB8Wxu+P0CNInnmIib8+vHfElpiZggJu1yfXlMIsqRSAAc
X-Gm-Gg: AZuq6aKvmlkXKWHMEsYB09lBMRRS2CRMl0PW8yUR6KSJQg7cYteNas0eBFEJsyw/c4/
	6xfPBtVxPjnVk9XuiA8h0vlqMtsAwQqD+TmodoLzfYfCV6Plg145xuQBqJvK7LlkV7AjAdwwQCQ
	1iz84QThkz/DRl1iTMjNzNhfO8JSAu0suENUeRQUUypWe4+C0e4vlbq8BZXdMZer4rXOzj8yRZS
	lof+6OTA/5mlA5+radsI/L06d5h+4NKNJDxITXajdd0cpg8FGsYaoZ5c1JdlQWrIEi/BXcoRCfc
	or1rJMJZiu41S7xNeZYz4LbE53oF6usdaxBzw7lyM+YXB62hWwxAXJXc3ygKM6bEFzN9WAScTvE
	Ctu/67ZoI2SnzM13RO0hRhA4UIp0lt4m8LC1iupPhYTi2ni164wyquVET9lUw9jUulqWs
X-Received: by 2002:a05:7301:1288:b0:2a4:701a:b9ba with SMTP id 5a478bee46e88-2b7c941886dmr2146822eec.14.1769823350978;
        Fri, 30 Jan 2026 17:35:50 -0800 (PST)
X-Received: by 2002:a05:7301:1288:b0:2a4:701a:b9ba with SMTP id 5a478bee46e88-2b7c941886dmr2146803eec.14.1769823350411;
        Fri, 30 Jan 2026 17:35:50 -0800 (PST)
Received: from [10.134.65.116] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16cf8f2sm14851809eec.7.2026.01.30.17.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 17:35:49 -0800 (PST)
Message-ID: <b5fd72fa-fcde-4f7a-bfad-17465d7e3841@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 17:35:37 -0800
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
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <20260119122729.287522-2-salman.nabi@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDAxMSBTYWx0ZWRfX8pW+VQD0/hTf
 xI/OHSqPsC9pRAOQTHW5v9rqFEHN187QmcnVMudelDBnEPiOmgjkn0Ha6tQh9lzXLMLeVkz7PO6
 MzFIlAZg81ErMKyGLQJqygxLrf1oxpBTmRZuiBNw9mhGNOZYtQzTAF8GLf029Ofj59XdzRbo9i0
 9Rob5INkIfhuP7derVZR7IEzfmmPtsuB2/LMJBYG0+bxs/hR9x9M00Rcr+OWMZ0ujL0qnKxtdFZ
 B0Aj+WGUkuMHXpcNwZTTcI0tW2kxzqKey8XkHZsMAfoEYprSFYiTUyLZp3LlQecgFp0slDl/5EG
 RPcEECU5D69jhFD7jFDRxtirVcSx+YZ+EYJOgGZCsP4i8S1Z4nnfVUEE+yqfMHuaJQ9zXKuwMIY
 deXWTO45S1WrMYp1Hqx6m0IJsfUocTaHPhlJC4KOaTeFlfNSaY8kiezSHr6xwiYeCCF4thoq+c/
 r9g6cU9FYIQoglAvgqg==
X-Authority-Analysis: v=2.4 cv=BdTVE7t2 c=1 sm=1 tr=0 ts=697d5c78 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=yEY9MXV1_v7_bfR7OAYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: C_1e11XeU6_dPtxLft5ptmePE0rLEbxQ
X-Proofpoint-ORIG-GUID: C_1e11XeU6_dPtxLft5ptmePE0rLEbxQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 clxscore=1011 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601310011

On 1/19/2026 4:27 AM, Salman Nabi wrote:
> The Arm Live Firmware Activation (LFA) is a specification [1] to describe
> activating firmware components without a reboot. Those components
> (like TF-A's BL31, EDK-II, TF-RMM, secure paylods) would be updated the
> usual way: via fwupd, FF-A or other secure storage methods, or via some
> IMPDEF Out-Of-Bound method. The user can then activate this new firmware,
> at system runtime, without requiring a reboot.
> The specification covers the SMCCC interface to list and query available
> components and eventually trigger the activation.
> 
> Add a new directory under /sys/firmware to present firmware components
> capable of live activation. Each of them is a directory under lfa/,
> and is identified via its GUID. The activation will be triggered by echoing
> "1" into the "activate" file:
> ==========================================
> /sys/firmware/lfa # ls -l . 6c*
> .:
> total 0
> drwxr-xr-x    2 0 0         0 Jan 19 11:33 47d4086d-4cfe-9846-9b95-2950cbbd5a00
> drwxr-xr-x    2 0 0         0 Jan 19 11:33 6c0762a6-12f2-4b56-92cb-ba8f633606d9
> drwxr-xr-x    2 0 0         0 Jan 19 11:33 d6d0eea7-fcea-d54b-9782-9934f234b6e4

Can you please explain or add a note on why we don't have name of the firmware
as the directory name and why you have selected GUID as top-level
directory name? 

---Trilok Soni
