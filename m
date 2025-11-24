Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7BD27472
	for <linux-coco@lists.linux.dev>; Mon, 24 Nov 2025 07:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763970584; cv=none; b=mma98+0YmfBaKh3a+hjKPP7X4LR6nFiMf3fVMgVoQH5nxMzMpF/Nsc0Wg+mu16JaNiicIUe83Ys2xO/Ms78dvlkXfSyqsJ6+6HNil8rh/95KZGgvqSYXOUPDYV6T/pp1DfovAfnuw7vCkxAnLY9HaXb+PTB1KthfomHmG2N71pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763970584; c=relaxed/simple;
	bh=Oh2hHGqKUMpK10WIrgrXCwfri+4P5W2C05i+gFz4uxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WaHlFH6TM2MmjeXYu1qsj/VntiAu4wBzRJv+JzAvG5okq3ul/46HPkCiqEAnQAFqi6uZonWFLuRYZsHCi507OrXshwTdC0daVkut+fZYRLU7yAmidIhuFgY/iF7pr/bIox5adRTIljG/gaOArBXcqL44rSLRryggiWngD2Fk5MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jUC8Go0k; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jUC8Go0k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763970583; x=1795506583;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Oh2hHGqKUMpK10WIrgrXCwfri+4P5W2C05i+gFz4uxs=;
  b=jUC8Go0knd8gZGmVyPwa3tBzG94Hjro1/cm33WG/jqnP5gDTdCJh1RFR
   kcX0Tqe3liczraHjdINBmoUEJ60pdior6JWCmRQ1sFAbtyJRFlOyNsk94
   tuWs/+cDqYV8kF6uvXRhVBykxPZc2V/6oDrQnWDRqgPBLI6PBGPigX+jq
   sjOfHVjF2FSiTApjUD/aizZzkqxPssnqrbXIrX0gB/pSBvRUCzyWrYziu
   DOodUmAOl1apoYcykDgTE3cWw41wlFXmzL4UPkwJKhvbd06Yy4xEbynl1
   u0r0CcmyEXndkaNc6HIXOtN0QyPdRJ8sQxUNQSginPcNfYP9YoHoMK0vW
   A==;
X-CSE-ConnectionGUID: izetBss6Qxixq4+q2YlZVw==
X-CSE-MsgGUID: qv/gTcX2Scidyvg1lVealg==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="64965982"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="64965982"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 23:49:42 -0800
X-CSE-ConnectionGUID: HmIi2quuT9Ke7B72D+jv/A==
X-CSE-MsgGUID: pHChPY+jQ4WmXl1NAkKjzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="192283328"
Received: from yinghaoj-desk.ccr.corp.intel.com (HELO [10.238.1.225]) ([10.238.1.225])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 23:49:37 -0800
Message-ID: <41cdd3d5-c45b-4991-ace9-bef7cf9ed197@linux.intel.com>
Date: Mon, 24 Nov 2025 15:49:34 +0800
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/21] coco/tdx-host: Implement FW_UPLOAD sysfs ABI for
 TDX Module updates
To: Chao Gao <chao.gao@intel.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org,
 reinette.chatre@intel.com, ira.weiny@intel.com, kai.huang@intel.com,
 dan.j.williams@intel.com, yilun.xu@linux.intel.com, sagis@google.com,
 vannapurve@google.com, paulmck@kernel.org, nik.borisov@suse.com,
 Farrah Chen <farrah.chen@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 "Kirill A. Shutemov" <kas@kernel.org>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-9-chao.gao@intel.com>
Content-Language: en-US
From: Binbin Wu <binbin.wu@linux.intel.com>
In-Reply-To: <20251001025442.427697-9-chao.gao@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/1/2025 10:52 AM, Chao Gao wrote:
[...]
>   
> +static enum fw_upload_err tdx_fw_prepare(struct fw_upload *fwl,
> +					 const u8 *data, u32 size)
> +{
> +	struct tdx_fw_upload_status *status = fwl->dd_handle;
> +
> +	if (status->cancel_request) {
> +		status->cancel_request = false;
> +		return FW_UPLOAD_ERR_CANCELED;
> +	}
> +
> +	return FW_UPLOAD_ERR_NONE;
> +}
> +
> +static enum fw_upload_err tdx_fw_write(struct fw_upload *fwl, const u8 *data,
> +				       u32 offset, u32 size, u32 *written)
> +{
> +	struct tdx_fw_upload_status *status = fwl->dd_handle;
> +
> +	if (status->cancel_request) {
> +		status->cancel_request = false;
> +		return FW_UPLOAD_ERR_CANCELED;
> +	}

Since the execution of the work is not protected by the mutex, if userspace
requests cancellation after this point, after the TDX module update finished,
it seems that the cancel value is left over and it could impact the next update?

> +
> +	/*
> +	 * tdx_fw_write() always processes all data on the first call with
> +	 * offset == 0. Since it never returns partial success (it either
> +	 * succeeds completely or fails), there is no subsequent call with
> +	 * non-zero offsets.
> +	 */
> +	WARN_ON_ONCE(offset);
> +	if (seamldr_install_module(data, size))
> +		return FW_UPLOAD_ERR_FW_INVALID;
> +
> +	*written = size;
> +	return FW_UPLOAD_ERR_NONE;
> +}
> +
> +static enum fw_upload_err tdx_fw_poll_complete(struct fw_upload *fwl)
> +{
> +	/*
> +	 * TDX Module updates are completed in the previous phase
> +	 * (tdx_fw_write()). If any error occurred, the previous phase
> +	 * would return an error code to abort the update process. In
> +	 * other words, reaching this point means the update succeeded.
> +	 */
> +	return FW_UPLOAD_ERR_NONE;
> +}
> +
> +static void tdx_fw_cancel(struct fw_upload *fwl)
> +{
> +	struct tdx_fw_upload_status *status = fwl->dd_handle;
> +
> +	status->cancel_request = true;
> +}
> +
>
[...]
