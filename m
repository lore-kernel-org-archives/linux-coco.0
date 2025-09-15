Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21991242D86
	for <linux-coco@lists.linux.dev>; Mon, 15 Sep 2025 16:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757953949; cv=none; b=ZWoeDSw9tSnQiQCQwgxpHAnKXJ6L8MPEB5OsWF6AJHqAxbIqBJy7tzqf4eRRq9ymFJYZBckVvtOhwgqX2JyqDgvPn/59EOsKRXwaaM3v4a5nNlt2ehu4vd3wKzwQZF4reWc8UWQnKU0T9ymD74I78pdlz2olcr/S7OxJkFhLY4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757953949; c=relaxed/simple;
	bh=aZusdISN2SAjdOUcYfVEgUykopuyr/RYuQBZ6x0rQyA=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o8C14ljXcQsWy7OyJsfDjznyKHO4gsC1tTGQFtJoHCcIoJeIWBhbZ6wHPIVpyq32wpluMd0eJGfjhdaGl9hoi1/0ZKcYHNCMG+sdw6Je3hhef3WF/GHD1LtdCZX2tXru1rf51lwTLrcj2oyOdhipUbOkhFKed4qIZgX3nqvkJ9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cQVrw6WDyz6GD92;
	Tue, 16 Sep 2025 00:30:56 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 8CE6C140137;
	Tue, 16 Sep 2025 00:32:24 +0800 (CST)
Received: from localhost (10.203.177.15) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 15 Sep
 2025 18:32:23 +0200
Date: Mon, 15 Sep 2025 17:32:22 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Dan Williams <dan.j.williams@intel.com>
CC: <linux-pci@vger.kernel.org>, <linux-coco@lists.linux.dev>,
	<gregkh@linuxfoundation.org>, <bhelgaas@google.com>, <lukas@wunner.de>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Alexey Kardashevskiy
	<aik@amd.com>, Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [PATCH resend v6 02/10] PCI/IDE: Enumerate Selective Stream IDE
 capabilities
Message-ID: <20250915173222.000028f4@huawei.com>
In-Reply-To: <20250911235647.3248419-3-dan.j.williams@intel.com>
References: <20250911235647.3248419-1-dan.j.williams@intel.com>
	<20250911235647.3248419-3-dan.j.williams@intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Thu, 11 Sep 2025 16:56:39 -0700
Dan Williams <dan.j.williams@intel.com> wrote:

> Link encryption is a new PCIe feature enumerated by "PCIe r7.0 section
> 7.9.26 IDE Extended Capability".
> 
> It is both a standalone port + endpoint capability, and a building block
> for the security protocol defined by "PCIe r7.0 section 11 TEE Device
> Interface Security Protocol (TDISP)". That protocol coordinates device
> security setup between a platform TSM (TEE Security Manager) and a
> device DSM (Device Security Manager). While the platform TSM can
> allocate resources like Stream ID and manage keys, it still requires
> system software to manage the IDE capability register block.
> 
> Add register definitions and basic enumeration in preparation for
> Selective IDE Stream establishment. A follow on change selects the new
> CONFIG_PCI_IDE symbol. Note that while the IDE specification defines
> both a point-to-point "Link Stream" and a Root Port to endpoint
> "Selective Stream", only "Selective Stream" is considered for Linux as
> that is the predominant mode expected by Trusted Execution Environment
> Security Managers (TSMs), and it is the security model that limits the
> number of PCI components within the TCB in a PCIe topology with
> switches.
> 
> Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
> Co-developed-by: Alexey Kardashevskiy <aik@amd.com>
> Signed-off-by: Alexey Kardashevskiy <aik@amd.com>
> Co-developed-by: Xu Yilun <yilun.xu@linux.intel.com>
> Signed-off-by: Xu Yilun <yilun.xu@linux.intel.com>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
Oops. I missed v6 and replied to 5.   Anyhow, comments stand so
please take a look back at that. As does
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
