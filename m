Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7F211C96
	for <linux-coco@lists.linux.dev>; Thu,  7 Sep 2023 15:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694099263; x=1725635263;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=tegXt8H4GqIs9pd9JuwuDFIteUSWjZ+yfenTAdbahT8=;
  b=e1tF449GPPd6ZH/nGNRSayoqci7MXBYx3vLjGW7CzPAAo7ZeBBsBQQYZ
   buEDSdaB2wf59czaw6mKU5tUngDJKe20q00Vt9jq/qapPRpj5/JFfH6rR
   0oyWyO8+nfX2tsP4pQAXCAum04m933yA2KUeglv/CENVGn1yfjTyasgnH
   jlODl1ljNTHeUC7QIY2p9v33jCKk8bvcLQvg+hEneHHsmX97LQdnlah1o
   N9Jm74JXIPzwDHiY8oE3K/Nh4Y1ZOe3yz1ifcB5Fd01AVoXAGKJ3gFbnl
   8WON+BCsR7MmR9I5OU78sPyTCaoop75v//23KePtGZXsOCKkZughgFuwZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="376286322"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="376286322"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 08:04:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="988806618"
X-IronPort-AV: E=Sophos;i="6.02,235,1688454000"; 
   d="scan'208";a="988806618"
Received: from ningle-mobl2.amr.corp.intel.com (HELO [10.209.13.77]) ([10.209.13.77])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 08:04:37 -0700
Message-ID: <81379d2d-4bb4-2384-5612-fdc82828cb0f@intel.com>
Date: Thu, 7 Sep 2023 08:04:36 -0700
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 3/3] /dev/mem: Do not map unaccepted memory
Content-Language: en-US
From: Dave Hansen <dave.hansen@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Borislav Petkov <bp@alien8.de>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Mike Rapoport <rppt@linux.ibm.com>, Lorenzo Stoakes <lstoakes@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Baoquan He <bhe@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-coco@lists.linux.dev, linux-efi@vger.kernel.org,
 kexec@lists.infradead.org
References: <20230906073902.4229-1-adrian.hunter@intel.com>
 <20230906073902.4229-4-adrian.hunter@intel.com>
 <9ffb7a3b-cf20-617a-e4f1-8a6a8a2c5972@intel.com>
 <20230907142510.vcj57cvnewqt4m37@box.shutemov.name>
 <7a50d04f-63ee-a901-6f39-7d341e423a77@intel.com>
In-Reply-To: <7a50d04f-63ee-a901-6f39-7d341e423a77@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/7/23 07:46, Dave Hansen wrote:
> Can a line of code in this patch even run in the face of IO_STRICT_DEVMEM=y?

Gah, I meant plain old STRICT_DEVMEM=y.
