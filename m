Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4D938DE6
	for <linux-coco@lists.linux.dev>; Tue,  3 Oct 2023 19:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696361383; x=1727897383;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=81YF4o0YC3d8UamrvcOL27fCGyA/L4irvbspH0jUGfc=;
  b=UB7nlmrP1hWGDC4UP2Hc/L0l6h/BVRe1nmjYWmy6dHY4EPFe1eWV5dWB
   H/n+0g7EGKWnLkKK67snYXej91xa4hkYusWisngZ/0BvPwqDUtxcS0QTn
   S9YC1MBScAWF9Fg/Ly9vTgnaUwTIo6Z/6rKWm560UPU5KYRhvcH+r1kYg
   lmfGbJmuOrmrS5POfkUnLXVQZ0iLhQMikqydt5C+0VlZpam9rBUxCc6aJ
   7uwUx9HbHyiXD4iFU9Zxp+48BBqtiuvFdPaFACEyJDI8uipksesZl0Wmv
   5SEn8NW1aj9EwrWRx7BfAYV1qhQ0agwWw6bkFRkwNY1XJczYqEbKoESbw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="1556872"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="1556872"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 12:29:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="821368263"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="821368263"
Received: from sknagara-mobl2.amr.corp.intel.com (HELO [10.209.121.241]) ([10.209.121.241])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 12:29:41 -0700
Message-ID: <9eee8abb-a1ba-46af-8317-0bc1c78179b3@linux.intel.com>
Date: Tue, 3 Oct 2023 12:29:42 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] virt: tdx-guest: Add Quote generation support
 using TSM_REPORTS
Content-Language: en-US
To: Peter Gonda <pgonda@google.com>, Dan Williams <dan.j.williams@intel.com>
Cc: linux-coco@lists.linux.dev, Erdem Aktas <erdemaktas@google.com>,
 peterz@infradead.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 dave.hansen@linux.intel.com
References: <169570181657.596431.6178773442587231200.stgit@dwillia2-xfh.jf.intel.com>
 <169570185411.596431.3153227201984845022.stgit@dwillia2-xfh.jf.intel.com>
 <CAMkAt6r2VPPMZ__SQfJse8qWsUyYW3AgYbOUVM0S_Vtk=KvkxQ@mail.gmail.com>
 <651602dc4c6e3_91c1e2947f@dwillia2-xfh.jf.intel.com.notmuch>
 <CAMkAt6rrzS85ZT9T7r6iwQHoVyEPwaxQ3Xayp_6XMbU+RJzS4w@mail.gmail.com>
 <CAMkAt6rwSwES_hEac=_7Gg8wcGosHMPXA3J2g_BGC_c+NbVp1w@mail.gmail.com>
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
In-Reply-To: <CAMkAt6rwSwES_hEac=_7Gg8wcGosHMPXA3J2g_BGC_c+NbVp1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 10/3/2023 11:37 AM, Peter Gonda wrote:
> On Fri, Sep 29, 2023 at 11:26 AM Peter Gonda <pgonda@google.com> wrote:
>>
>> On Thu, Sep 28, 2023 at 4:49 PM Dan Williams <dan.j.williams@intel.com> wrote:
>>>
>>> Peter Gonda wrote:
>>>> On Mon, Sep 25, 2023 at 10:17 PM Dan Williams <dan.j.williams@intel.com> wrote:
>>>>>
>>>>> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>>>>>
>>>>> In TDX guest, the attestation process is used to verify the TDX guest
>>>>> trustworthiness to other entities before provisioning secrets to the
>>>>> guest. The first step in the attestation process is TDREPORT
>>>>> generation, which involves getting the guest measurement data in the
>>>>> format of TDREPORT, which is further used to validate the authenticity
>>>>> of the TDX guest. TDREPORT by design is integrity-protected and can
>>>>> only be verified on the local machine.
>>>>>
>>>>> To support remote verification of the TDREPORT in a SGX-based
>>>>> attestation, the TDREPORT needs to be sent to the SGX Quoting Enclave
>>>>> (QE) to convert it to a remotely verifiable Quote. SGX QE by design can
>>>>> only run outside of the TDX guest (i.e. in a host process or in a
>>>>> normal VM) and guest can use communication channels like vsock or
>>>>> TCP/IP to send the TDREPORT to the QE. But for security concerns, the
>>>>> TDX guest may not support these communication channels. To handle such
>>>>> cases, TDX defines a GetQuote hypercall which can be used by the guest
>>>>> to request the host VMM to communicate with the SGX QE. More details
>>>>> about GetQuote hypercall can be found in TDX Guest-Host Communication
>>>>> Interface (GHCI) for Intel TDX 1.0, section titled
>>>>> "TDG.VP.VMCALL<GetQuote>".
>>>>>
>>>>> Trusted Security Module (TSM) [1] exposes a common ABI for Confidential
>>>>> Computing Guest platforms to get the measurement data via ConfigFS.
>>>>> Extend the TSM framework and add support to allow an attestation agent
>>>>> to get the TDX Quote data (included usage example below).
>>>>>
>>>>>   report=/sys/kernel/config/tsm/report/report0
>>>>>   mkdir $report
>>>>>   dd if=/dev/urandom bs=64 count=1 > $report/inblob
>>>>>   hexdump -C $report/outblob
>>>>>   rmdir $report
>>>>>
>>>>> GetQuote TDVMCALL requires TD guest pass a 4K aligned shared buffer
>>>>> with TDREPORT data as input, which is further used by the VMM to copy
>>>>> the TD Quote result after successful Quote generation. To create the
>>>>> shared buffer, allocate a large enough memory and mark it shared using
>>>>> set_memory_decrypted() in tdx_guest_init(). This buffer will be re-used
>>>>> for GetQuote requests in the TDX TSM handler.
>>>>>
>>>>> Although this method reserves a fixed chunk of memory for GetQuote
>>>>> requests, such one time allocation can help avoid memory fragmentation
>>>>> related allocation failures later in the uptime of the guest.
>>>>>
>>>>> Since the Quote generation process is not time-critical or frequently
>>>>> used, the current version uses a polling model for Quote requests and
>>>>> it also does not support parallel GetQuote requests.
>>>>>
>>>>> Link: https://lore.kernel.org/lkml/169342399185.3934343.3035845348326944519.stgit@dwillia2-xfh.jf.intel.com/ [1]
>>>>> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>>>>> Reviewed-by: Erdem Aktas <erdemaktas@google.com>
>>>>> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
>>>>
>>>> Hey Dan,
>>>>
>>>> I tried running your test commands on an SNP enabled guest. To build
>>>> the kernel I just checked out linus/master and applied your series. I
>>>> haven't done any debugging yet, so I will update with what I find.
>>>>
>>>> root@Ubuntu2004:~#   hexdump -C $report/outblob
>>>> [  219.871875] ------------[ cut here ]------------
>>>> [  219.876642] kernel BUG at include/linux/scatterlist.h:187!
>>>
>>> Ok, it does not like virtual address of one of the buffers, but my
>>> changes "should" not have affected that as get_ext_report() internally
>>> uses snp_dev->certs_data and snp_dev->response for bounce buffering the
>>> actual request / response memory. First test I want to try once I can
>>> get on an SNP system is compare this to the ioctl path just make sure
>>> that succeeds.
>>
> 
> I think there may be an issue with CONFIG_DEBUG_SG. That was the
> warning we were getting in my above stack trace:
> 
>> [  219.876642] kernel BUG at include/linux/scatterlist.h:187!
> 
> This was for this line in enc_dec_message():
> 
>         sg_set_buf(&src[1], src_buf, hdr->msg_sz);
> 
> I am not sure why in sg_set_buf() virt_addr_valid() returns false for
> the address given in the sev_report_new() which is from the variable
> 'ext_req' which is stack allocated?
> 
> static inline void sg_set_buf(struct scatterlist *sg, const void *buf,
>      unsigned int buflen)
> {
> #ifdef CONFIG_DEBUG_SG
>     BUG_ON(!virt_addr_valid(buf));
> #endif
>     sg_set_page(sg, virt_to_page(buf), buflen, offset_in_page(buf));
> }
> 
> When I disable CONFIG_DEBUG_SG in my config. Your patch seems to work,
> well at least it doesn't crash the guest. I haven't checked if the
> report is valid yet.
> 

Dan, do you think it is related to not allocating direct mapped memory (using
kvalloc)?

-- 
Sathyanarayanan Kuppuswamy
Linux Kernel Developer
