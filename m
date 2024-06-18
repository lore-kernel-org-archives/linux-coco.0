Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB9414C58E
	for <linux-coco@lists.linux.dev>; Tue, 18 Jun 2024 17:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718731318; cv=none; b=Upy+yHDAZwHRafINUQ0AGD6w/oEhbHq8U3MNLiz5B7rPFZXkKecFIAdMTGh1QkB2b2Ob02txnhB6WQNf4Hd7n395UadU0ROwooU1Jh6RjahCZqrqUinG+q/GXZDdaK7otG1nu61JZNU6g55He8nXcV07GkqMoCmlR4qiRvgLy2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718731318; c=relaxed/simple;
	bh=bsVokfsJrJR2cRpyjIXEMxdNXyqgBpZXtl9kY/mti1A=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=O209hVb5Czhko7HpBevDG5AgmgTWir3SGQIAnUvEwFMd5xM8Uoku6yKdIyvBDsK6/yqIOU9tXg7mTh4l34ZqjytpAVkUNvEaCMKZYRuoHwZeFiopY64BR9jp3mJXKfkVOVno8aJ16GS/R2v+D5Hq043nwlgzBOdVerbVIor+67Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=AHKJM69s; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="AHKJM69s"
Received: from [100.65.0.17] (unknown [20.236.10.120])
	by linux.microsoft.com (Postfix) with ESMTPSA id C7B1720B7004;
	Tue, 18 Jun 2024 10:21:55 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C7B1720B7004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1718731316;
	bh=8qgAm8SJGz97J3QCsDSTv37+33XsXvUm8qxrMQOuEJQ=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=AHKJM69skZr7DtDCCpIfWeimIP8A8CF+yNo97CiZ5rilYr+ix+B+SOdaSty4V7aOT
	 2xX0y3CzdpPyNm6PMEssyS2ZCEkanrrhoSJrQ8ig8FZ/JxiF0jed0iu/6WqHUJ92bg
	 5UWpCoejZ70ZOJwWoluQ1sn90/Y92oIev09VT/G8=
Message-ID: <0c3b2cc7-076d-45a5-9750-f78f15c8c0f0@linux.microsoft.com>
Date: Tue, 18 Jun 2024 10:21:56 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: eahariha@linux.microsoft.com
Subject: Re: [PATCH v2 1/1] Documentation: hyperv: Add overview of
 Confidential Computing VM support
To: mhklinux@outlook.com, kys@microsoft.com, haiyangz@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, corbet@lwn.net,
 linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-coco@lists.linux.dev
References: <20240618165059.10174-1-mhklinux@outlook.com>
Content-Language: en-US
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <20240618165059.10174-1-mhklinux@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/18/2024 9:50 AM, mhkelley58@gmail.com wrote:
> From: Michael Kelley <mhklinux@outlook.com>
> 
> Add documentation topic for Confidential Computing (CoCo) VM support
> in Linux guests on Hyper-V.
> 
> Signed-off-by: Michael Kelley <mhklinux@outlook.com>
> ---
> Changes in v2:
> * Added hyperlink to Coconut github project
> 
>  Documentation/virt/hyperv/coco.rst  | 260 ++++++++++++++++++++++++++++
>  Documentation/virt/hyperv/index.rst |   1 +
>  2 files changed, 261 insertions(+)
>  create mode 100644 Documentation/virt/hyperv/coco.rst
>

Looks good to me.

Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>
