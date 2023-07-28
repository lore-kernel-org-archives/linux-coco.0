Received: from mgamail.intel.com (unknown [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2151914AA0
	for <linux-coco@lists.linux.dev>; Fri, 28 Jul 2023 19:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690572657; x=1722108657;
  h=subject:from:to:cc:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XEvRgEzLzJgiPhpM8NRlpjxiZhfplAwFtjWJ70NzV80=;
  b=hCQyOmXE9Blt045mDHBqnvL6Ttlq4W+lZ9H0tQdv9Cl9FNZm59MHeM76
   Po3RAmWDNAjldjcA6lQRS8nKWfGNIQChi/CB/YjvYw74KyIW1LlWWsBpf
   yOO1eBexIdaP/5RoS5O3Ir5mB4CQcOCQtRvRNhGp6odPqC5xRidwcFpGn
   QhFeClwbQG2unMqN3G+tH+ohcFjJ933LIEibmgnM0ilIKalwl4qXTl21Q
   i9rB+0eNWBBf5NJnlIaVaChJg8DZ1y7OknVGn6cKKVP4YTSVRapVW1GoA
   7inVcVflFW7rTT+R5lGe1Ln0v9DlUvO8BA0TI/CqHegvR8nuzB0YuO+OF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="366137068"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="366137068"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 12:30:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="762694002"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="762694002"
Received: from cheehong-laptop.gar.corp.intel.com (HELO dwillia2-xfh.jf.intel.com) ([10.212.158.179])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 12:30:52 -0700
Subject: [PATCH 0/4] keys: Introduce a keys frontend for attestation reports
From: Dan Williams <dan.j.williams@intel.com>
To: dhowells@redhat.com
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dionna Amalie Glaze <dionnaglaze@google.com>, Borislav Petkov <bp@alien8.de>,
 Jarkko Sakkinen <jarkko@kernel.org>, Samuel Ortiz <sameo@rivosinc.com>,
 Dionna Glaze <dionnaglaze@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-coco@lists.linux.dev,
 keyrings@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 28 Jul 2023 12:30:52 -0700
Message-ID: <169057265210.180586.7950140104251236598.stgit@dwillia2-xfh.jf.intel.com>
User-Agent: StGit/0.18-3-g996c
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The bulk of the justification for this patch kit is in "[PATCH 1/4]
keys: Introduce tsm keys". The short summary is that the current
approach of adding new char devs and new ioctls, for what amounts to the
same functionality with minor formatting differences across vendors, is
untenable. Common concepts and the community benefit from common
infrastructure.

Use Keys to build common infrastructure for confidential computing
attestation report blobs, convert sevguest to use it (leaving the
deprecation question alone for now), and pave the way for tdx-guest and
the eventual risc-v equivalent to use it in lieu of new ioctls.

The sevguest conversion is only compile-tested.

This submission is To:David since he needs to sign-off on the idea of a
new Keys type, the rest is up to the confidential-computing driver
maintainers to adopt.

Changes from / credit for internal review:
- highlight copy_{to,from}_sockptr() as a common way to mix
  copy_user() and memcpy() paths (Andy)
- add MODULE_DESCRIPTION() (Andy)
- clarify how the user-defined portion blob might be used (Elena)
- clarify the key instantiation options (Sathya)
- drop usage of a list for registering providers (Sathya)
- drop list.h include from tsm.h (Andy)
- add a comment for how TSM_DATA_MAX was derived (Andy)
- stop open coding kmemdup_nul() (Andy)
- add types.h to tsm.h (Andy)
- fix punctuation in comment (Andy)
- reorder security/keys/Makefile (Andy)
- add some missing includes to tsm.c (Andy)
- undo an 81 column clang-format line break (Andy)
- manually reflow tsm_token indentation (Andy)
- move allocations after input validation in tsm_instantiate() (Andy)
- switch to bin2hex() in tsm_read() (Andy)
- move init/exit declarations next to their functions (Andy)


---

Dan Williams (4):
      keys: Introduce tsm keys
      virt: sevguest: Prep for kernel internal {get,get_ext}_report()
      mm/slab: Add __free() support for kvfree
      virt: sevguest: Add TSM key support for SNP_{GET,GET_EXT}_REPORT


 drivers/virt/coco/sev-guest/Kconfig     |    2 
 drivers/virt/coco/sev-guest/sev-guest.c |  135 ++++++++++++++-
 include/keys/tsm.h                      |   71 ++++++++
 include/linux/slab.h                    |    2 
 security/keys/Kconfig                   |   12 +
 security/keys/Makefile                  |    1 
 security/keys/tsm.c                     |  282 +++++++++++++++++++++++++++++++
 7 files changed, 494 insertions(+), 11 deletions(-)
 create mode 100644 include/keys/tsm.h
 create mode 100644 security/keys/tsm.c

base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
