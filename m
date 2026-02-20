Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C731A1C84AB
	for <linux-coco@lists.linux.dev>; Fri, 20 Feb 2026 21:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771624112; cv=none; b=Xq6QNSL69eIv1iDhp6hXkk2N8+2qMIBwHf3TLjleW7494OJOt4ANCxT0wW+JKevew+MFaXLGVa1VtI4Q9pXUY/00hDRl4kxFeeB0eLD5eX8IVu/LAgQ8Zi3Oaz7+XPPPGUSJshwcFr7Nej+6h0oOxXtMMsgECPryByJaToecHus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771624112; c=relaxed/simple;
	bh=bknMDF8lQwRxo7xmJ5Xq23k1HXA3PGZJ5TZ07s81Cv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jG4A4I7N+yfrmBDLEUHFdCOVcIB7HHwd1A5EpvcfY/gp5gNeBqhHzdaYyVX0WdmSwI56KhZIITsOaP2HXnW8nzaN9cSf81coEA1OtMD8NPov1Rlbw/hIQAS/dpv3I5aXEmda3CJFfs4+6bzQvwOOKwKC+LZUgRis24VTnezfByY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JdQ66zrl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kN/ZVx72; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JdQ66zrl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kN/ZVx72"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61KFevJq2507641
	for <linux-coco@lists.linux.dev>; Fri, 20 Feb 2026 21:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kfhuDMVQ2sXAvKNxypnteftZi1j21aONkPIUNCFMvE4=; b=JdQ66zrluqUy5oLB
	Q4bOyiX9UpzfZk/rBtIix8lptSOscEqZVg8tdASFTwRzKsb62wbuG2j9JlTxeCKS
	VhsWmU/qmrIe19n1tYsx4TcMI3lTZ8/zR/6B2pTN8MLRz6xsEFORMwkpBkhXq6di
	2mWZnVXOmY3Bsv3SChlYCNVyr+8sY0DOjMZVM6rTxxPOMyrT4E7ZnvS+lb2UfjRf
	29HIjf2TZW+U+LsCrrfeeSwCBFFSsuMKH9Gc/os/bzrDQJy8T1A6d+YmRy7YVRgC
	dEjVKih/uHiQNMcFSjcyjsf2HpQzFjci6AmGtsgZ+7znqJTLSSe/T2FMLHqFQlJZ
	ACBHsg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cee2sb0dw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-coco@lists.linux.dev>; Fri, 20 Feb 2026 21:48:28 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7d4c7afa9e0so31498746a34.0
        for <linux-coco@lists.linux.dev>; Fri, 20 Feb 2026 13:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771624108; x=1772228908; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kfhuDMVQ2sXAvKNxypnteftZi1j21aONkPIUNCFMvE4=;
        b=kN/ZVx72GxvT+4sPf9qiBuQCNEeCuZC85Xfi4AOeGRSTYujmLJ6PGLE1O0K7IQ6dwG
         NNgrt375Eu6ozIRgBHhPd+UBCXJE1TpiL+V5KSHktXQ+t8hPwJZa6DaGrefZpuY+5eFK
         xTDB+1d9XmWWnx87SZy9Ne8gtDbOeumDQdCzif2T7AMLyLBoh0nWlLI3fUmJ7Ig4J3ly
         N02/+HjChkiH3f5JFszyIPiQumC7YmCha6BzodJQ6jR094aXiwKhG10Q52BK5TBAisrv
         JOpsqKf655W/+wPb4vTcuTOrN+4iCYqp3A2xgG4umPj7CGUXgoGKbCXdfylW67h8Ojsj
         3nNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771624108; x=1772228908;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kfhuDMVQ2sXAvKNxypnteftZi1j21aONkPIUNCFMvE4=;
        b=S5D23T9e1BthqJ3I/H5dF4Pvd5OVvfjcst3JRIXxJat/uosee8vpVP4KbUntNIbvv4
         Mlf1jEfsREgf7zHHNsVvd/1ucfVhu6OGsFqKV0s8ZSbIKzblgHxALgyW7o37abvtYzqz
         dSZCwqq0maLUv0SbwLo3rIHpBAhmNxoVCc8ZlGo3V9/hrU7H4HJGTHbbLduAAR2nNtno
         q/Pj+K5mMNn3zdKM2TWyzOyb5WU/jz0Rt3NNlM8G/IETdsTVHb7R2ptUd6Zl5RVl/ZUE
         yKufLvtHfZARNIVLue/HNO4r9J1Ak9eUUmczZgXRtBu7lXkztngIj/M7RHerysLsfEsO
         81Jg==
X-Forwarded-Encrypted: i=1; AJvYcCUFZPQwbOleaGLu2Eu201Q3ju/WmvZXGerPZ7s5PkqDw8hcXB4S4h4NE2jsGrElf1ckyAoI9Mn6+gaD@lists.linux.dev
X-Gm-Message-State: AOJu0YwQLwhcNyUuJ/p8xtBlVRvukOU4Ay+pAZrGZfINj1xTJ3/rxb8z
	1UmGVJF4wop92TR1bA4Q2IoD4uKA32EhL2Y3WvWgHSVMGRIxqnQ8yrHSRJizFW28FJRDtb9jREF
	lbscF732BV9jpcz8L7K+P8dkEyPoBItJw09qWLWw4qbYXvgrwIkDkR8h/E69LM2Kp
X-Gm-Gg: AZuq6aKV9rfdDyzJ5Un4/FOciyFFW7vy+qeOK71x+IFjcnfP3efUS8ZDwMPMIFy2RUW
	tIeL5ATg828Upn3c1slnWvHlWFcflJlhuholEyDlij3h+VHqeEO1BCEi1mt86+DhXoN0Ht54cq4
	G7GrjN8KEgzSS9BRkfz21sY+t2k21anOZlQcd9+FZTNRa7+08f8auRpl+fJ0hUoPRvZ1aCBRE+k
	oDt6F+qKOUoKlxXzDn7jgOMLfOt2jQ4RwT1qB9Vs1CasYro6tpflAroF40mbO/ufJ8/0ng+iiX8
	OmrT69JDLe24OCJdgyLKrYRnUz5K3dhDJjUXgbzW252F5iUdnCmwIoV89LnJz1IdnEhyboMGXse
	Glffpx4iptUUGUd9/gNqVRWuWPqdRjJ535AcS2+/r2c50GngVROKrUdY=
X-Received: by 2002:a05:6830:3689:b0:7cf:d0f3:4610 with SMTP id 46e09a7af769-7d52bf36ea6mr1036701a34.28.1771624108059;
        Fri, 20 Feb 2026 13:48:28 -0800 (PST)
X-Received: by 2002:a05:6830:3689:b0:7cf:d0f3:4610 with SMTP id 46e09a7af769-7d52bf36ea6mr1036688a34.28.1771624107604;
        Fri, 20 Feb 2026 13:48:27 -0800 (PST)
Received: from [192.168.86.165] ([76.176.48.107])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d52cf9f489sm608050a34.7.2026.02.20.13.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 13:48:27 -0800 (PST)
Message-ID: <2379d582-47a0-47c1-968a-04d5dc2a0d9d@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 13:48:25 -0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] firmware: smccc: add support for Live Firmware
 Activation (LFA)
To: Andre Przywara <andre.przywara@arm.com>, Salman Nabi <salman.nabi@arm.com>
Cc: mark.rutland@arm.com, lpieralisi@kernel.org, linux-kernel@vger.kernel.org,
        vwadekar@nvidia.com, sdonthineni@nvidia.com, vsethi@nvidia.com,
        linux-coco@lists.linux.dev, sudeep.holla@arm.com, ardb@kernel.org,
        linux-arm-kernel@lists.infradead.org, chao.gao@intel.com
References: <20260119122729.287522-1-salman.nabi@arm.com>
 <20260119122729.287522-2-salman.nabi@arm.com>
 <20260220173929.02bc2cf2@orionap.fritz.box>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <20260220173929.02bc2cf2@orionap.fritz.box>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YI4hr4HGAWI2y4jy9_5cikDo7Gia99f3
X-Proofpoint-GUID: YI4hr4HGAWI2y4jy9_5cikDo7Gia99f3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDE3OSBTYWx0ZWRfX7jBNEimtVRIO
 5TYOeZ+P96AkHKFqi7sYFKFU48lFXBw7xg8yF+Jfe2C7O5pSDX46dG4XL8TorXVPUbGLC3vwEbB
 1LjHIzPscQ5mS1GWvCe38vySriAENN0RN7dE3XfCegeEZ8KSQBh3SElE5c654rWvqdgcXa6+jLS
 LgI1ZocbXt05Jrn2cvQvyjOK28NQsIxcgFwTs6PF+L+k/f/MaTHWDlnzYDpsnihNil1A+Tq/L6C
 FZbCp5G2o85XZzJ8MS6tZhwAn2vg+RfIEvE84DCH2JKjiCnMyku4ETg1LLLjzrj4jAnX6w1LANI
 70kq8swGAtJQ/dd/ePILU+LNYvEXFvLUuE7aS6WYjNDPertViXXDWpekVgJrU4lAuPR425Z1atx
 xcyf5r2qqIrwAlCONeoV53mjMrNw3K8yIeNHdSPMxz1JbEasoag+Cx4jcQGfPX8B3DdSPykoAcv
 EN2rONogfSnV/m6//xQ==
X-Authority-Analysis: v=2.4 cv=NajrFmD4 c=1 sm=1 tr=0 ts=6998d6ac cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=7CQSdrXTAAAA:8 a=KiQHqBYQfqT5kMCPLFsA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_03,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200179

On 2/20/2026 9:39 AM, Andre Przywara wrote:
> On Mon, 19 Jan 2026 12:27:29 +0000
> Salman Nabi <salman.nabi@arm.com> wrote:
> 
> Hey,
> 
> for the records: while working on improving the patch and during internal
> review, we found some bugs and issues in there. I will mark them below for
> the benefit of others. I will send a v2 after -rc1, with those things
> fixed and some improvements, and will include Vedashree's patches, so
> that we have everything in one series.
> 
>> The Arm Live Firmware Activation (LFA) is a specification [1] to describe
>> activating firmware components without a reboot. Those components
>> (like TF-A's BL31, EDK-II, TF-RMM, secure paylods) would be updated the
>> usual way: via fwupd, FF-A or other secure storage methods, or via some
>> IMPDEF Out-Of-Bound method. The user can then activate this new firmware,
>> at system runtime, without requiring a reboot.
>> The specification covers the SMCCC interface to list and query available
>> components and eventually trigger the activation.
>>
>> Add a new directory under /sys/firmware to present firmware components
>> capable of live activation. Each of them is a directory under lfa/,
>> and is identified via its GUID. The activation will be triggered by echoing
>> "1" into the "activate" file:
>> ==========================================
>> /sys/firmware/lfa # ls -l . 6c*
>> .:
>> total 0
>> drwxr-xr-x    2 0 0         0 Jan 19 11:33 47d4086d-4cfe-9846-9b95-2950cbbd5a00
>> drwxr-xr-x    2 0 0         0 Jan 19 11:33 6c0762a6-12f2-4b56-92cb-ba8f633606d9
>> drwxr-xr-x    2 0 0         0 Jan 19 11:33 d6d0eea7-fcea-d54b-9782-9934f234b6e4
>>
>> 6c0762a6-12f2-4b56-92cb-ba8f633606d9:
>> total 0
>> --w-------    1 0        0             4096 Jan 19 11:33 activate
>> -r--r--r--    1 0        0             4096 Jan 19 11:33 activation_capable
>> -r--r--r--    1 0        0             4096 Jan 19 11:33 activation_pending
>> --w-------    1 0        0             4096 Jan 19 11:33 cancel
>> -r--r--r--    1 0        0             4096 Jan 19 11:33 cpu_rendezvous
>> -r--r--r--    1 0        0             4096 Jan 19 11:33 current_version
>> -rw-r--r--    1 0        0             4096 Jan 19 11:33 force_cpu_rendezvous
>> -r--r--r--    1 0        0             4096 Jan 19 11:33 may_reset_cpu
>> -r--r--r--    1 0        0             4096 Jan 19 11:33 name
>> -r--r--r--    1 0        0             4096 Jan 19 11:33 pending_version
>> /sys/firmware/lfa/6c0762a6-12f2-4b56-92cb-ba8f633606d9 # grep . *
>> grep: activate: Permission denied
>> activation_capable:1
>> activation_pending:1
>> grep: cancel: Permission denied
>> cpu_rendezvous:1
>> current_version:0.0
>> force_cpu_rendezvous:1
>> may_reset_cpu:0
>> name:TF-RMM
>> pending_version:0.0
>> /sys/firmware/lfa/6c0762a6-12f2-4b56-92cb-ba8f633606d9 # echo 1 > activate
>> [ 2825.797871] Arm LFA: firmware activation succeeded.
>> /sys/firmware/lfa/6c0762a6-12f2-4b56-92cb-ba8f633606d9 #
>> ==========================================
>>
>> [1] https://developer.arm.com/documentation/den0147/latest/
>>
>> Signed-off-by: Salman Nabi <salman.nabi@arm.com>
>> ---
>>  drivers/firmware/smccc/Kconfig  |   8 +
>>  drivers/firmware/smccc/Makefile |   1 +
>>  drivers/firmware/smccc/lfa_fw.c | 668 ++++++++++++++++++++++++++++++++
>>  3 files changed, 677 insertions(+)
>>  create mode 100644 drivers/firmware/smccc/lfa_fw.c
>>
>> diff --git a/drivers/firmware/smccc/Kconfig b/drivers/firmware/smccc/Kconfig
>> index 15e7466179a6..ff7ca49486b0 100644
>> --- a/drivers/firmware/smccc/Kconfig
>> +++ b/drivers/firmware/smccc/Kconfig
>> @@ -23,3 +23,11 @@ config ARM_SMCCC_SOC_ID
>>  	help
>>  	  Include support for the SoC bus on the ARM SMCCC firmware based
>>  	  platforms providing some sysfs information about the SoC variant.
>> +
>> +config ARM_LFA
>> +	tristate "Arm Live Firmware activation support"
>> +	depends on HAVE_ARM_SMCCC_DISCOVERY
> 
> As the kernel test robot correctly pointed out, this only works on ARM64.
> SMCCC v1.2 is only defined for AArch64, and the LFA spec documents
> actually explicitly mentions AArch64-only at the beginning.


Thank you for the update. How to test these patches outside of NVIDIA devices?
Is it possible to test them on the QEMU or FVP? Any instructions on doing
these tests will be helpful w/ the virtual platforms. 

---Trilok Soni
